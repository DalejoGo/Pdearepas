# 18. Escalabilidad y crecimiento

- **Lecturas públicas** (menú) servidas desde caché de borde: escalan sin tocar la base de datos.
- **Escrituras** (pedidos, acciones) son pocas y pequeñas; una sola transacción por acción; índices en `orders(status, created_at)`, `orders(driver_id, status)`, `orders(code)`, `reservations(date, status)`.
- **Archivos** en R2 con variantes y caché larga (`immutable`, nombres con hash).
- **Tiempo real:** *polling* con cursor y `ETag` (8–15 s). Si más adelante se necesita tiempo real, migrar a Durable Objects/WebSocket detrás de la misma interfaz del cliente.
- **Varias sucursales:** `location_id` ya está en el modelo; agregaría selector de sucursal, ajustes y horarios por sucursal.
- **Pasarela de pago:** `payment_method` extensible; añadir una pasarela (Wompi, Bold, etc.) implica un nuevo método y un *webhook* que fije `payment_confirmed_at`.
- **Límites de planes gratuitos:** documentados en `docs/COSTOS.md`, con el paso concreto al plan de pago si se superan.

---

