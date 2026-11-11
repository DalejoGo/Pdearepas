# Despliegue y migración a producción

## Ambientes

| Ambiente | Cuentas | Base de datos | Secretos |
|---|---|---|---|
| Local | — | Postgres en Docker o rama de desarrollo de Neon | `.env`, `.dev.vars` |
| Staging | Cuentas temporales indicadas por Alejandro | Rama/proyecto de staging | `wrangler pages secret put` |
| Producción | **Cuentas del restaurante** (o de AIM a nombre del restaurante) | Proyecto de producción propio | **Secretos nuevos** |

## Regla de oro

**Nada de lo que está en las cuentas temporales llega a producción.** No se copian ni "transfieren" secretos, tokens, ids ni configuración. Todo se **recrea** con valores nuevos.

## Lista de migración (completar con comandos reales durante el proyecto)

- [ ] Crear cuenta de Cloudflare del restaurante y proyecto de Pages.
- [ ] Crear proyecto de Neon de producción (región elegida en la Fase 2) y base de datos limpia.
- [ ] Aplicar migraciones (con confirmación explícita) y cargar la semilla mínima (ajustes, sin datos de ejemplo).
- [ ] Crear bucket de R2 de producción.
- [ ] Crear widget de Turnstile del dominio real.
- [ ] Generar `SESSION_SECRET` y demás secretos nuevos con `openssl rand -base64 48` y cargarlos sin imprimirlos.
- [ ] Crear usuarios reales con `scripts/create-admin.ts` (cada persona escribe su contraseña).
- [ ] Cargar menú, fotos y ajustes reales desde el panel.
- [ ] Conectar el dominio, HTTPS y redirección `www`.
- [ ] Ajustar CSP y analítica al dominio real.
- [ ] Verificar `/api/health` y el flujo completo con un pedido real de prueba.
- [ ] Configurar alertas y calendario de rotación de claves.
- [ ] Eliminar datos de ejemplo y revocar las sesiones y tokens de las cuentas temporales.

## Procedimiento de despliegue (se completa en la Fase 1 y 11)

1. `bash scripts/ci/all.sh` en verde.
2. Migraciones explícitas del ambiente destino.
3. Build y publicación.
4. Verificación: `/api/health` + prueba de humo del flujo cliente → admin → domiciliario.
5. Registro en `docs/ESTADO.md`.
