# Demo de referencia

`propuesta-demo.html` es la **demo interactiva aprobada** que se mostró al restaurante. Es un solo archivo HTML sin dependencias de servidor: se abre con doble clic en el navegador, o con `pnpm dlx serve docs/referencia`.

## Para qué sirve

Es la **referencia de comportamiento y de estilo**. El producto final puede mejorar el diseño, pero **no debe perder ninguna función** de la demo. **No es código para reutilizar**: está escrita como prototipo (un solo archivo, datos en memoria) y el sistema real se construye desde cero según el plan.

## Qué muestra (pestañas)

| Pestaña | Qué hacer para probarla |
|---|---|
| **Propuesta** | Texto comercial: situación, funciones, estados del pedido, módulos opcionales |
| **Sitio de ejemplo** | Agregar productos, completar datos, ver el mensaje de WhatsApp prellenado y enviar el pedido; reservar una mesa |
| **Panel del restaurante** | Ver pedidos con estado y etiqueta "Venta válida" / "Aún no es venta"; confirmar, asignar domiciliario, verificar pago, cancelar; editar precios y disponibilidad; agregar productos y banners |
| **Domiciliario** | Ver los pedidos asignados, marcar "Salí a entregar", "Entregado y cobrado" o "No entregado" con motivo, y ver el efectivo cobrado |
| **Alcance** | Entregables, cronograma y lista de lo que se necesita del restaurante |

## Qué es de ejemplo (ficticio)

- Menú, precios, nombres de clientes y pedidos ya cargados.
- Número de WhatsApp (`573001234567`) y costo de domicilio ($3.000).
- Todo lo que se hace en la demo vive solo mientras la página está abierta.

## Qué tomar de la demo

- **Tokens de diseño** (en el `<style>` al inicio): rojo `#D92E14`, amarillo `#F7C21B`, madera `#2B1B12`, fondo `#F5F2EF`, texto `#2A1D16`, modo oscuro equivalente; tipografías Barlow Condensed (títulos) y Barlow (texto).
- **Estructura de pantallas**: menú con chips de categoría, carrito, datos de entrega, panel con estadísticas arriba y tarjetas de pedido, vista del domiciliario en columna única.
- **Máquina de estados y reglas de venta válida**: ver `docs/plan/08-reglas-de-negocio.md` (es la fuente de verdad, no la demo).
- **Formato del mensaje de WhatsApp**: ver `docs/plan/10-mensajes-whatsapp.md`.

## Logo

`../../assets/logo-360.jpg` (360 px). Pedir el original en alta resolución a Alejandro.
