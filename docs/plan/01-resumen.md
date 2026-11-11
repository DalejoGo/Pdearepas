# 1. Resumen del proyecto

## 1.1 Qué es

Un sitio web tipo tienda en línea (inspirado en la experiencia de KFC Colombia y Frisby: portada con promociones, menú por categorías, carrito y compra en pocos toques) para un restaurante de comidas rápidas que hoy:

- Tiene su menú y publicidad como **fotos en Facebook**.
- Recibe pedidos **por WhatsApp**, anotando a mano nombre, productos, dirección y forma de pago.
- Recibe reservas por mensaje.

## 1.2 Resultado esperado

Un sistema con **tres accesos**:

1. **Cliente (público):** ve menú, arma pedido, lo envía por WhatsApp con todo completo, sigue el estado de su pedido, reserva mesa, ve promociones y videos.
2. **Administrador (con clave):** gestiona menú, precios, promociones, videos, horarios y ajustes; ve y confirma pedidos, asigna domiciliario, verifica transferencias, gestiona reservas, ve ventas válidas y cierre de caja.
3. **Domiciliario (con clave, celular):** ve solo sus pedidos asignados, marca "en camino", "entregado y cobrado" o "no entregado" con motivo.

**Una venta es válida solo cuando está entregada y pagada** (ver sección 8.3). Ese es el corazón del sistema.

## 1.3 Referencia visual y funcional

- **Demo aprobada por Alejandro:** `docs/referencia/propuesta-demo.html` (HTML autocontenido; ábrase en el navegador). Muestra el flujo del cliente, el panel del administrador y la vista del domiciliario con datos de ejemplo. **Es la referencia de comportamiento y de estilo.** El producto final puede mejorar el diseño, pero no debe perder ninguna función de la demo.
- **Logo:** `assets/logo-360.jpg` (360 px). Pedir a Alejandro el logo original en alta resolución o vectorial (pregunta Q-0.9). Paleta de marca derivada del logo: rojo-naranja `#D92E14`, amarillo `#F7C21B`, madera oscura `#2B1B12`.
- **Facebook del restaurante:** https://www.facebook.com/share/1Dd3b6a6uF/ (requiere iniciar sesión; Claude Code no puede leerlo. Pedir a Alejandro las fotos del menú o la lista de productos).
- **Sitios de referencia (solo experiencia de uso):** https://www.kfc.co/?catalogueId=1 y https://www.frisby.com.co/ . No copiar textos, imágenes ni código de ellos.

## 1.4 Resumen de tecnologías (decisión por defecto; detalle en la sección 6)

Conjunto elegido para este proyecto (decisión por defecto; este proyecto **no depende de ningún otro repositorio**): **pnpm + Turborepo, TypeScript, Astro + islas Preact + Tailwind, Hono en Cloudflare Pages Functions, Neon Postgres + Drizzle ORM, Zod como contratos compartidos, jose para sesiones, Cloudflare R2 para archivos, Cloudflare Turnstile contra bots, Cloudflare Workers AI para el asistente opcional, Vitest + Playwright para pruebas, Biome para lint/format.** Usar solo lo que haga falta.

---

