# Fase 11 — Staging, pruebas con el restaurante y capacitación

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

1. Desplegar a **staging** (con autorización según Q-0.7): `scripts/deploy-staging.sh` (migraciones → build → publicar → verificar `/api/health` y el flujo de humo).
2. Cargar el **menú real** y fotos reales; revisar con Alejandro y el restaurante.
3. **Prueba piloto** con pedidos reales de bajo riesgo (personas conocidas) durante uno o dos días: cliente → admin → domiciliario; comparar ventas válidas con el cuaderno/WhatsApp.
4. Escribir `docs/MANUAL-ADMIN.md` y `docs/MANUAL-DOMICILIARIO.md` (con capturas, lenguaje sencillo, 1–2 páginas cada uno) y `docs/OPERACION.md` (qué hacer si falla algo).
5. Capacitación (Q-11.1): guion de 30–45 min y lista de verificación.
6. Corregir lo que salga del piloto.
**Aceptación:** el restaurante completa un día de operación con el sistema sin ayuda del desarrollador; cero diferencias entre ventas válidas del sistema y el registro manual del piloto.

