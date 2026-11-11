# 11. Diseño y experiencia

- **Dirección:** tienda de comida rápida estilo KFC/Frisby, **móvil primero**, imágenes de producto grandes, botones grandes, jerarquía clara de precio. Identidad: rojo-naranja, amarillo, madera oscura (el logo está sobre una pared de madera).
- **Tokens base** (heredar de la demo): `--red #D92E14`, `--yellow #F7C21B`, `--wood #2B1B12`, `--wood-2 #3D281B`, fondo cálido `#F5F2EF`, texto `#2A1D16`, ok `#1E8E4E`, advertencia `#B26A00`. Modo oscuro con equivalentes (ver demo). Tipografías: Barlow Condensed (títulos, mayúsculas) y Barlow (texto).
- **Móvil:** barra superior con logo, menú inferior o botón flotante del carrito, chips de categoría con desplazamiento horizontal, tarjetas de producto de 2 columnas en 360 px.
- **Panel de administración:** navegación lateral (en móvil, barra horizontal) con contador de pedidos nuevos; tabla/tarjetas de pedidos con estado en color **y** texto (no solo color); acciones visibles; modo oscuro opcional.
- **Domiciliario:** una sola columna, tarjetas grandes, botón principal de ancho completo, alto contraste al sol, sin menús profundos.
- **Estados vacíos y de error diseñados** (sin pedidos, sin conexión, local cerrado, producto agotado).
- **Movimiento:** mínimo, respetando `prefers-reduced-motion`.
- **Accesibilidad:** foco visible, etiquetas en formularios, mensajes de error asociados (`aria-describedby`), zonas táctiles ≥ 44 px, contraste AA.
- **Imágenes:** mientras no haya fotos reales, usar *placeholders* neutros marcados "Foto real aquí" (como en la demo). **No** usar fotos de otras marcas ni de Facebook sin permiso de Alejandro.

---

