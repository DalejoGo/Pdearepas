# 16. Pruebas y calidad

## 16.1 Pirámide
- **Unitarias (Vitest):** `domain` (totales, estados, venta válida, horarios, teléfonos, mensajes). Meta ≥ 80 % de cobertura en lógica de negocio.
- **Integración (Vitest + PGlite):** rutas de API con base real en memoria, autorización por rol, transacciones, idempotencia.
- **E2E (Playwright, móvil y escritorio):** flujo completo cliente → admin → domiciliario → venta válida; reservas; panel de menú; login y bloqueos.
- **Accesibilidad:** axe en cada vista clave.
- **Rendimiento:** Lighthouse y presupuesto de peso.
- **Seguridad:** pruebas negativas de autorización, inyección, abuso; revisión OWASP.

## 16.2 Casos obligatorios (mínimo)
1. Pedido válido en efectivo y en transferencia; con y sin opciones; domicilio y recoger.
2. Pedido con producto desactivado, opción fuera de rango, carrito vacío, local cerrado, por debajo del mínimo, teléfono inválido, cuerpo gigante.
3. Reintento del mismo pedido (idempotencia) y dos clics simultáneos.
4. Dos administradores actuando a la vez sobre el mismo pedido (409 en el segundo).
5. Domiciliario intentando ver/modificar un pedido ajeno o llamar rutas de admin (403/404).
6. Efectivo entregado = venta válida; transferencia entregada sin verificar = **no** válida; verificada = válida; cancelada y no entregada = no válidas.
7. Cambio de precio después del pedido **no** altera el pedido guardado.
8. Cierre de caja con diferencia positiva, negativa y cero.
9. Modo avión del domiciliario: acciones encoladas y sincronizadas sin duplicados.
10. Mensajes de WhatsApp: *snapshot* para domicilio, recoger, efectivo con cambio, transferencia, con nota, con opciones.

## 16.3 Verificación en navegador
Para cada fase con interfaz: levantar en `localhost` y **probar el flujo en un navegador real** (herramientas de Chrome o Playwright), en 360 px y escritorio, claro y oscuro; no dar por terminada una fase solo porque pasan las pruebas.

## 16.4 CI (`scripts/ci/all.sh`)
`biome check` → `tsc --noEmit` (todos los paquetes) → `vitest run` → `astro build` → (en CI de GitHub) Playwright + axe. Debe fallar ante cualquier error o aviso.

## 16.5 Prueba de carga
Con una herramienta ligera (`autocannon`, `k6` o un script con `fetch`): 50 usuarios concurrentes durante 2 minutos sobre `GET /api/menu`, y 10 pedidos por segundo durante 1 minuto sobre `POST /api/orders` en **staging** (con datos de prueba y Turnstile en modo de prueba). Registrar p50/p95/p99, errores y consumo de cuota en `docs/RENDIMIENTO.md`.

---

