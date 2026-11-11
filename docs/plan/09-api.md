# 9. API (Hono, prefijo `/api`)

Todas las entradas y salidas validadas con Zod de `packages/contracts`. Errores con forma uniforme `{ error: { code, message, details? } }`, mensajes en español claros. Respuestas JSON; `Cache-Control` explícito en cada ruta.

## 9.1 Públicas

| Método y ruta | Descripción | Notas |
|---|---|---|
| `GET /api/menu` | Menú completo, banners, video, ajustes públicos, estado abierto/cerrado | Caché de borde (ver 9.5) |
| `POST /api/orders` | Crea pedido | Turnstile + rate limit + idempotencia; devuelve `{code, trackingUrl, waUrl, total}` |
| `GET /api/orders/:token` | Estado público | Teléfono enmascarado; sin datos de pago hasta confirmado |
| `POST /api/reservations` | Crea reserva | Turnstile + rate limit; devuelve `waUrl` |
| `GET /api/health` | Salud | Sin datos sensibles |

## 9.2 Autenticación

`POST /api/auth/login`, `POST /api/auth/logout`, `GET /api/auth/me`, `POST /api/auth/change-password`.

## 9.3 Idempotencia

`POST /api/orders` exige `client_request_id` (UUID generado en el navegador al abrir el formulario). Si ya existe, devuelve el pedido original con el mismo código en vez de crear otro.

## 9.4 Panel (rol `admin`)

`/api/admin/orders` (lista con filtros y cursor `since`), `/api/admin/orders/:id/{confirm|assign|verify-payment|cancel|reopen|deliver}`, `/api/admin/reports/*`, `/api/admin/cash-settlements`, CRUD de `categories`, `products`, `option-groups`, `options`, `banners`, `media` (subida), `video`, `reservations` (+ `confirm|reject`), `users`, `settings`, `audit`.

## 9.5 Domiciliario (rol `driver`)

`GET /api/driver/orders` (solo asignados), `POST /api/driver/orders/:id/{start|deliver|fail}`, `GET /api/driver/summary`.

## 9.6 Caché del menú

- `GET /api/menu` responde con `Cache-Control: public, s-maxage=60, stale-while-revalidate=300` y se guarda con la Cache API de Cloudflare.
- Al guardar cualquier cambio de menú/ajustes en el panel se **purga** esa clave de caché.
- El HTML de la portada y el menú incluyen una **instantánea del menú generada en el build** (para primer pintado rápido y SEO); la isla la revalida contra `/api/menu`. Un *deploy hook* de Cloudflare Pages, con límite de frecuencia, regenera la instantánea tras cambios del panel (máximo 1 vez cada 10 min). *Confirmar esta decisión en la Fase 1 (DEC).*

---

