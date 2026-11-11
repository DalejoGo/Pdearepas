# 7. Modelo de datos (Drizzle / Postgres)

Convenciones: claves `uuid` (v7 si es posible) salvo `orders.code` (entero por secuencia); `created_at`/`updated_at` `timestamptz` en UTC; dinero en `integer` (pesos); borrado lógico con `deleted_at`/`active`; índices en columnas de búsqueda y llaves foráneas; `location_id` (por ahora fijo) para crecer a varias sucursales.

| Tabla | Campos principales |
|---|---|
| `locations` | id, name, whatsapp_e164, address, timezone, created_at |
| `settings` | location_id (pk), delivery_fee, free_delivery_from, min_order, unconfirmed_alert_minutes, allow_orders_when_closed, hide_unavailable, payment_instructions (json: lista de cuentas), social_links (json), reservation_lead_minutes, reservation_max_days, reservation_max_party |
| `opening_hours` | location_id, weekday (0–6), open_time, close_time, closed (bool) |
| `special_days` | location_id, date, closed, open_time, close_time, note |
| `users` | id, location_id, username (único, minúsculas), display_name, role (`admin`/`driver`), password_hash, active, last_login_at, failed_attempts, locked_until, phone |
| `sessions` | id, user_id, token_hash, created_at, expires_at, last_seen_at, user_agent, ip_hash, revoked_at |
| `categories` | id, location_id, name, slug, sort, active |
| `products` | id, category_id, name, slug, description, price, image_id, available, featured, sort, deleted_at |
| `option_groups` | id, product_id, name, required, min, max, sort |
| `options` | id, group_id, name, price_delta, available, sort |
| `media` | id, kind (`image`/`video`), storage_key, mime, bytes, width, height, variants (json), alt, created_at |
| `banners` | id, title, text, media_id, link_type, link_ref, starts_at, ends_at, sort, active |
| `featured_video` | location_id, media_id o external_url, poster_media_id |
| `orders` | id, code (secuencia), token_hash, public_token_prefix, location_id, status, fulfillment (`delivery`/`pickup`), customer_name, customer_phone_e164, address, address_notes, payment_method (`transfer`/`cash`), cash_change_from (int, null), notes, subtotal, delivery_fee, total, payment_confirmed_at, payment_confirmed_by, driver_id, client_request_id (único), consent_at, created_at, confirmed_at, on_the_way_at, delivered_at, cancelled_at, cancel_reason, failed_reason |
| `order_items` | id, order_id, product_id, name_snapshot, unit_price_snapshot, qty, options_snapshot (json), line_total, note |
| `order_events` | id, order_id, at, actor_user_id (null = cliente/sistema), actor_label, type, from_status, to_status, data (json) — **solo inserción** |
| `reservations` | id, location_id, status (`pending`/`confirmed`/`rejected`/`cancelled`/`attended`/`no_show`), name, phone_e164, date, time, party_size, notes, consent_at, created_at, decided_by, decided_at, reject_reason |
| `cash_settlements` | id, location_id, driver_id, business_date, expected_amount, received_amount, difference, received_by, notes, created_at |
| `rate_limits` | key, window_start, count (o usar KV/Cache si es mejor) |
| `audit_log` | id, at, actor_user_id, action, entity, entity_id, diff (json), ip_hash |
| `jobs_outbox` | id, type, payload, status, attempts, run_at (para notificaciones opcionales) |

Migraciones versionadas con `drizzle-kit`; semilla idempotente desde `content/seed.json`. En staging y producción las migraciones se aplican con un comando explícito, nunca al arrancar la API.

---

