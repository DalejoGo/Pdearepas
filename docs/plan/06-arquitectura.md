# 6. Arquitectura y tecnologías

## 6.1 Diagrama lógico

```
 Cliente (celular/PC)                 Admin (PC/celular)             Domiciliario (celular PWA)
        │                                    │                                   │
        └──────────────┬─────────────────────┴───────────────────────────────────┘
                       ▼
        Cloudflare (dominio + CDN + caché de borde + WAF + Turnstile)
                       │
        ┌──────────────┴───────────────────────────┐
        ▼                                          ▼
  Sitio web (Astro estático + islas Preact)   API (Hono en Pages Functions, /api/*)
  - portada, menú, carrito, pedido,           - menú, pedidos, reservas, auth, panel
    seguimiento, reservas                     - Zod en cada entrada/salida
  - admin y domiciliario = islas protegidas   - jose (sesiones), RBAC, rate limit
                                                   │            │             │
                                                   ▼            ▼             ▼
                                            Neon Postgres   R2 (fotos,    Workers AI /
                                            (Drizzle)       videos)       Telegram (opc.)
```

## 6.2 Decisiones de tecnología (por defecto; cada una se registra como DEC-NNN en la Fase 1)

| Capa | Elección | Por qué | Alternativa si falla |
|---|---|---|---|
| Monorepo | **pnpm + Turborepo** | Maduro; builds en caché | — |
| Lenguaje | **TypeScript 5.9.x, estricto** | Tipos compartidos | — |
| Web | **Astro** (salida estática) + **islas Preact** + **Tailwind** | Carga rápida, poco JS, SEO | Astro + adaptador Cloudflare (SSR) solo si hace falta |
| Estado cliente | **@preact/signals** (carrito) | Ligero | — |
| API | **Hono** en **Cloudflare Pages Functions** | Gratis, sin arranque en frío, mismo dominio (sin CORS) | Workers independientes |
| Validación/contratos | **Zod** en `packages/contracts` | Única fuente de verdad de formas de datos | — |
| Base de datos | **Neon Postgres** + **Drizzle ORM** + `drizzle-kit` | Postgres serverless con ramas y PITR | **Cloudflare D1** si la latencia desde el borde es mala (ver 6.3) |
| Sesiones | **jose** (JWT firmado) en cookie HttpOnly + tabla `sessions` para revocar | Sin estado en el borde y revocable | — |
| Hash de contraseñas | **@noble/hashes** (scrypt o argon2id compatible con Workers) | Funciona en Workers; evitar `bcrypt` nativo | PBKDF2 de WebCrypto con ≥ 600.000 iteraciones |
| Archivos | **Cloudflare R2** detrás de interfaz `Storage` | Barato/gratis, sin egreso | — |
| Anti-bots | **Cloudflare Turnstile** | Gratis, sin fricción | — |
| IA (opcional) | **Cloudflare Workers AI** (modelo vigente en el momento) | Gratis hasta un cupo; sin API key externa | Otro proveedor con tope de gasto |
| Mensajería (opc.) | **Telegram Bot API** | Gratis | Correo (Cloudflare Email) |
| Tareas programadas | **Cron Triggers** de Workers | Resumen diario, limpieza, respaldos | — |
| Pruebas | **Vitest**, **PGlite** (Postgres en memoria), **Playwright**, **@axe-core/playwright**, **Lighthouse** | Estándar de facto | — |
| Lint/format | **Biome** | Rápido | — |
| Fechas | **date-fns** + `date-fns-tz` (o `Intl`/Temporal si es estable) | Evitar errores de zona horaria | — |
| Teléfonos | **libphonenumber-js** (versión "min") | Normalizar a E.164 +57 | Regex propia estricta |
| Íconos | **lucide-preact** | Ligero | — |
| Fuentes | **Barlow Condensed** (títulos) y **Barlow** (texto), autoalojadas con `@fontsource` | Identidad de la demo; sin llamadas a terceros (CSP) | — |

## 6.3 Latencia con Neon (riesgo conocido, medir en la Fase 2)

Mediciones previas del equipo con Cloudflare + Neon dieron ~1,25 s por petición solo para abrir la conexión a Neon desde el borde (2,1 s con Neon dormido). Para este proyecto:
1. Usar el **driver HTTP/serverless de Neon** y agrupar las operaciones de un pedido en **una sola transacción/una sola ida y vuelta**.
2. Elegir la **región de Neon más cercana** a los usuarios (probar `aws-sa-east-1` y `aws-us-east-1`) y activar **Smart Placement** del Worker para acercarlo a la base de datos.
3. **Nunca** poner la base de datos en la ruta de lecturas públicas: el menú se sirve desde **caché de borde** (ver 9.5).
4. Medir `POST /api/orders` y acciones del panel en staging (≥ 30 muestras). Si el p95 supera 2,5 s, abrir **DEC** para migrar a **Cloudflare D1** (SQLite en el borde) manteniendo Drizzle, y repetir las medidas.
5. Desactivar el "scale to zero" de Neon en producción si el plan lo permite, o documentar el costo de arranque en frío (~1 s) como aceptable solo para el primer pedido tras horas de inactividad.

## 6.4 Estructura del repositorio

```
punto-de-la-arepa/
├─ PLAN.md                    ← este archivo
├─ README.md                  ← arranque rápido
├─ CLAUDE.md                  ← reglas para sesiones futuras (derivadas de la sección 0)
├─ AGENTS.md                  ← alias de CLAUDE.md si se usan otras herramientas
├─ package.json  pnpm-workspace.yaml  turbo.json  biome.json  .env.example
├─ docker-compose.yml         ← Postgres local (+ Mailpit si se usa correo)
├─ apps/
│  ├─ web/                    ← Astro: sitio público + shells de /admin y /domiciliario
│  └─ edge/                   ← Hono: API (Pages Functions), Drizzle, migraciones
├─ packages/
│  ├─ contracts/              ← esquemas Zod: Order, Product, Reservation, Settings, errores
│  ├─ domain/                 ← lógica pura: totales, estados, mensajes WhatsApp, horarios, teléfonos
│  ├─ config/                 ← tsconfig/biome base
│  └─ ui/                     ← componentes Preact compartidos (botones, tarjetas, tokens)
├─ content/
│  └─ seed.json               ← menú y ajustes iniciales (EJEMPLO hasta tener los reales)
├─ assets/                    ← logo y recursos de marca
├─ scripts/
│  ├─ ci/all.sh               ← lint + tipos + pruebas + build
│  ├─ ci/push.sh              ← push esperando CI
│  ├─ deploy-staging.sh  deploy-prod.sh
│  ├─ seed.ts  create-admin.ts (pide la contraseña por la terminal, no por argumento)
│  └─ measure-latency.ts
├─ e2e/                       ← Playwright
└─ docs/
   ├─ DECISIONES.md  DESPLIEGUE.md  SEGURIDAD.md  RENDIMIENTO.md  COSTOS.md
   ├─ PENDIENTES.md  OPERACION.md (runbook)  MANUAL-ADMIN.md  MANUAL-DOMICILIARIO.md
   ├─ LEGAL.md (borradores)  referencia/propuesta-demo.html
```

---

