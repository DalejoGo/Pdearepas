# Fase 5 — Panel del administrador

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

**Objetivo:** el restaurante opera el día a día sin ayuda.
1. Login/logout/cambio de contraseña (RF-20) y shell del panel (`/admin`) protegido (cabecera `noindex`, no listado en el sitemap).
2. **Pedidos** (RF-21): lista con *polling*, sonido y contador, filtros, acciones y transiciones con la máquina de estados, avisos por WhatsApp, resaltado de pedidos sin confirmar.
3. **Menú** (RF-23): categorías, productos, opciones, disponibilidad, destacados, orden.
4. **Medios** (RF-24, 26): subida de imágenes con reducción en el navegador y variantes; subida de video; interfaz `Storage` con implementación R2.
5. **Banners** (RF-25), **Ajustes** (RF-28), **Usuarios** (RF-29).
6. Ronda 3 (Q-5.x): crear los usuarios reales con `create-admin.ts`.
7. Pruebas de autorización (un `driver` no puede llamar rutas `admin`), de transiciones y E2E del flujo admin.
**Aceptación:** RF-20…29 cumplidos; cambio de precio visible en el sitio en ≤ 60 s; auditoría de cada acción.
**Paralelizable:** pedidos, menú+medios y ajustes+usuarios (tres agentes con carpetas distintas).

