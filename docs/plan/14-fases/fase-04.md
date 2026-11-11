# Fase 4 — Carrito, pedido y WhatsApp

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

**Objetivo:** un cliente real puede pedir de principio a fin.
1. Carrito con señales y `localStorage` (RF-04), barra flotante, página de pedido (RF-05) con validaciones y máscara de teléfono.
2. `POST /api/orders` completo: Turnstile, límites de frecuencia, idempotencia, recálculo en servidor, transacción, secuencia de código, evento inicial en `order_events`, mensaje de WhatsApp y enlace.
3. Pantalla de confirmación y **seguimiento** `/pedido/:token` con *polling* (RF-06/07).
4. Pruebas: unitarias (totales/mensaje), integración (pedido válido, inválido, duplicado, producto desactivado, local cerrado, mínimo), E2E con Playwright (flujo del cliente).
5. Ronda 2 de preguntas (Q-4.x) y carga de los datos de transferencia.
**Aceptación:** RF-04, 05, 06, 07; el mensaje coincide con la plantilla 10.1 en una prueba de *snapshot*; reintentar no duplica; el total del cliente coincide con el del servidor en todos los casos de prueba.

