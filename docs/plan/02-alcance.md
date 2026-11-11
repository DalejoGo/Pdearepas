# 2. Alcance

## 2.1 Dentro del alcance (v1)

- Sitio público: inicio, menú, producto con opciones, carrito, pedido, seguimiento de pedido, reservas, contacto/ubicación/horarios, páginas legales (privacidad y términos).
- Panel de administración: pedidos, menú (categorías, productos, opciones, fotos), promociones/banners, videos, reservas, domiciliarios (usuarios), ajustes del negocio, reportes y cierre de caja.
- Vista del domiciliario (PWA instalable en el celular).
- Mensaje de pedido y de reserva a WhatsApp con formato fijo.
- Ventas válidas, estados de pedido, auditoría de cambios.
- Staging, producción, CI, monitoreo básico, respaldos, manual de uso y capacitación.

## 2.2 Opcional (se ofrece; se construye solo si Alejandro lo aprueba en la Fase 0, Q-0.8)

- Resumen diario de ventas por mensaje (Telegram o correo).
- Aviso de pedido o reserva nueva en el celular del dueño (Telegram / notificaciones web push).
- Asistente con IA en el sitio (Cloudflare Workers AI, con cupo gratuito diario).
- Confirmación automática por WhatsApp Business API (**tiene costo y aprobación de Meta**; por defecto NO).

## 2.3 Fuera del alcance (v1)

- Pagos en línea con tarjeta o PSE (pasarela). El pago es **transferencia o efectivo al entregar**. Se deja la arquitectura lista para agregar una pasarela después (campo `payment_method` extensible).
- Aplicación móvil nativa en tiendas (se usa PWA).
- Facturación electrónica DIAN.
- Integración con inventario o POS.
- Mapa de rastreo GPS del domiciliario.
- Multi-sucursal (el modelo de datos reserva `location_id` para crecer, pero v1 usa una sola sucursal).

---

