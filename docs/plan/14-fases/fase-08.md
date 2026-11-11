# Fase 8 — Reportes y cierre de caja

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

**Objetivo:** el dueño sabe cuánto vendió realmente.
1. Vista SQL/función única de **venta válida** (8.3) y reportes: día/semana/mes, por producto, por forma de pago, por domiciliario, cancelados/no entregados.
2. Cierre de caja (8.4) y exportación CSV.
3. Pruebas con conjuntos de datos que cubran: entregado sin pago confirmado (no suma), transferencia verificada antes y después de entregar, cancelados, pickup.
**Aceptación:** RF-22; los totales de los reportes coinciden con un cálculo independiente en las pruebas.

