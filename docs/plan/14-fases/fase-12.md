# Fase 12 — Producción y entrega

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

1. **Cuentas del restaurante:** crear (Alejandro) cuenta de Cloudflare, Neon y GitHub del restaurante, o de AIM a nombre del restaurante (Q-12.1). **Recrear** proyectos, base de datos, R2, Turnstile y secretos **desde cero** con la lista de `docs/DESPLIEGUE.md`. No copiar valores de las cuentas personales.
2. **Dominio:** Alejandro compra/apunta el dominio; Claude Code guía los registros DNS y la conexión con Pages; HTTPS y redirección `www`.
3. Migraciones y semilla en producción (con confirmación explícita), usuarios reales con `create-admin.ts`, datos del negocio y menú real cargados desde el panel.
4. Ajustar CSP y analítica (Cloudflare Web Analytics, sin cookies) al dominio real.
5. **Aprobación explícita de Alejandro (Q-12.2)** y publicación; verificación en vivo: flujo completo con un pedido real de prueba, correo/aviso de pedido, panel y domiciliario.
6. Monitoreo: alertas de errores/5xx, revisión del panel de Cloudflare y Neon, calendario de rotación de claves, plan de respaldo.
7. **Entrega:** repositorio y documentación, accesos transferidos (sin compartir contraseñas por chat), lista de límites de planes gratuitos y qué hacer al crecer, plan de soporte posterior (opcional).
**Aceptación:** sitio en el dominio real, pedido de prueba completado, venta válida registrada, restaurante con accesos propios y manuales.

---

