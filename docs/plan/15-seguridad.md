# 15. Seguridad (lista mínima a cumplir antes de producción; basada en OWASP Top 10:2025)

- [ ] **Control de acceso:** RBAC en **cada** ruta de panel y de domiciliario, filtro por `driver_id` del lado del servidor, pruebas negativas (IDOR); tokens de seguimiento por hash, no por id incremental.
- [ ] **Autenticación:** hash lento con sal; política de contraseña (≥ 10 caracteres para admin, ≥ 8 para domiciliario); bloqueo/espera tras 5 intentos fallidos en 15 min (por usuario e IP); Turnstile tras intentos fallidos; mensajes de error que no revelan si el usuario existe; sesiones revocables; cookies `HttpOnly; Secure; SameSite=Lax`; cambio de contraseña invalida sesiones.
- [ ] **CSRF:** `SameSite=Lax` + verificación de `Origin`/`Host` en métodos que cambian estado + cabecera personalizada exigida por la API.
- [ ] **Inyección:** solo consultas parametrizadas (Drizzle); validación Zod de **toda** entrada; límite de tamaño de cuerpo; sanitización/escape al mostrar texto del cliente en el panel (sin `innerHTML` con datos de usuario).
- [ ] **Manipulación de precios:** el cliente nunca envía precios; el servidor los lee de la base.
- [ ] **Abuso:** límites por IP y por teléfono — pedidos: 5 por 10 min por IP y 3 por 10 min por teléfono; reservas: 3 por hora por teléfono; login: ver arriba; Turnstile en pedido y reserva; tope de pedidos pendientes por teléfono.
- [ ] **Subidas:** validar tipo real (firma de bytes), tamaño, reprocesar imágenes (elimina metadatos/EXIF), nombres generados por el servidor, sin ejecución, R2 sin listado público.
- [ ] **CSP estricta** (sin `unsafe-inline`/`unsafe-eval`), `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy`, HSTS, `frame-ancestors 'none'`; orígenes externos solo los necesarios (Turnstile, analítica).
- [ ] **Secretos:** fuera del código y del chat; rotación documentada; `.env` en `.gitignore`; búsqueda de secretos en CI (p. ej. `gitleaks`).
- [ ] **Dependencias:** versiones fijas, `pnpm audit` sin altas/críticas, Renovate/Dependabot con la regla de 14 días.
- [ ] **Datos personales:** mínimos (nombre, teléfono, dirección), enmascarados en vistas públicas, retención limitada (RF-55), consentimiento registrado (`consent_at`), canal para solicitar supresión.
- [ ] **Registro y auditoría:** `order_events` y `audit_log` inmutables; los logs no incluyen contraseñas, tokens ni datos completos de clientes.
- [ ] **Errores:** sin trazas ni detalles internos al cliente; páginas de error amables.
- [ ] **Integridad:** transiciones de estado atómicas; idempotencia en pedido y en acciones del domiciliario.
- [ ] **SSRF/redirecciones:** enlaces de video externos solo a una lista permitida; sin redirecciones abiertas.

---

