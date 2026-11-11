# Fase 3 — Sitio público: base, menú y marca

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

**Objetivo:** el cliente ve el menú real de la base, rápido y bonito.
1. Sistema de diseño en `packages/ui` y `apps/web`: tokens (colores, tipografías autoalojadas, espaciado), modo claro/oscuro, componentes (botón, tarjeta de producto, chips, barra, estados vacíos).
2. Layout, navegación móvil, pie con datos del negocio, páginas: Inicio, Menú, Contacto, Privacidad, Términos.
3. `GET /api/menu` con caché de borde y purga; instantánea del menú en el build; isla de revalidación.
4. Página de producto (hoja inferior en móvil) con **opciones** (RF-03).
5. Banners, destacados y bloque de video; estado abierto/cerrado.
6. SEO (RF-12), `sitemap.xml`, `robots.txt`, JSON-LD, imágenes responsivas, fuentes autoalojadas, CSP estricta (Astro con hashes; sin `unsafe-inline`).
7. Pruebas: componentes (Vitest), accesibilidad (axe), visual en 360/768/1280 px.
**Aceptación:** RF-01, 02, 03, 09, 10, 12 cumplidos; Lighthouse móvil ≥ 90 en local (con Throttling); sin errores de consola; CSP sin violaciones.
**Paralelizable:** diseño (ui), contenido legal, SEO y API del menú.

