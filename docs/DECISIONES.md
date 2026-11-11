# Registro de decisiones

Formato de cada decisión:

```
## DEC-NNN — Título corto
- **Fecha:** AAAA-MM-DD
- **Decide:** quién
- **Contexto:** por qué hay que decidir
- **Decisión:** qué se hace
- **Alternativas descartadas:** qué y por qué
- **Consecuencias:** qué cambia, qué riesgos quedan
```

Toda decisión que cambie el plan o la arquitectura se escribe **antes** de aplicarse.

---

## DEC-001 — Proyecto autónomo
- **Fecha:** 2026-11-11
- **Decide:** Alejandro
- **Contexto:** el proyecto se ejecutará desde otra máquina.
- **Decisión:** este paquete es autosuficiente: sin dependencia de otros repositorios, carpetas, cuentas ni memoria de conversaciones previas.
- **Consecuencias:** las reglas viven en `CLAUDE.md`; el avance en `docs/ESTADO.md`.

## DEC-002 — Stack por defecto (propuesto; se confirma en la Fase 1)
- **Fecha:** 2026-11-11
- **Decide:** propuesta de Claude, pendiente de confirmación
- **Decisión:** pnpm + Turborepo, TypeScript, Astro + Preact + Tailwind, Hono en Cloudflare Pages Functions, Neon Postgres + Drizzle, Zod, jose, R2, Turnstile, Workers AI (opcional), Vitest + Playwright, Biome. Detalle en `docs/plan/06-arquitectura.md`.
- **Alternativas:** D1 en lugar de Neon si la latencia es alta (Fase 2).

## DEC-003 — Cuentas temporales y producción desde cero (propuesto; se confirma en Q-0.4)
- **Fecha:** 2026-11-11
- **Decisión:** el desarrollo usa cuentas temporales solo para staging. Producción se recrea en cuentas del restaurante con secretos nuevos.

## DEC-004 — Venta válida
- **Fecha:** 2026-11-11
- **Decide:** Alejandro
- **Decisión:** un pedido es venta solo si está `ENTREGADO` y con el pago confirmado (efectivo: el domiciliario al cobrar; transferencia: el administrador al verificar). Ver `docs/plan/08-reglas-de-negocio.md`.
