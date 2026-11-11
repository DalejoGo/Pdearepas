# 13. Credenciales, llaves y secretos

## 13.1 Reglas

1. **Nunca** se escriben llaves en el chat, en el código, en commits, en logs ni en capturas.
2. Si Alejandro pega una llave en el chat: **no usarla**, pedirle que la **revoque** y cree otra y la cargue él mismo con los comandos de esta sección.
3. Local: variables en `.env` (ignorado por git) y `.dev.vars` para Wrangler. `.env.example` lista **todas** las variables (sin valores) y se mantiene al día.
4. Staging/producción: secretos con `wrangler pages secret put <NOMBRE>` (o `wrangler secret put`); CI con `gh secret set <NOMBRE>` leyendo desde la entrada estándar.
5. Secretos **distintos** para cada ambiente. Los generados por Claude (ej. firma de sesiones) se crean con `openssl rand -base64 48` y se cargan **sin imprimirlos**.
6. Rotar tokens al cerrar el proyecto y al hacer el traspaso a las cuentas del restaurante.

## 13.2 Lo que hace falta y cómo se obtiene

| Qué | Para qué | Quién lo crea | Cómo se carga | Cuándo |
|---|---|---|---|---|
| Sesión de GitHub (`gh auth login`) | Repositorio y CI | Alejandro (inicio de sesión interactivo) | Lo guarda `gh` | Fase 1 |
| Sesión de Cloudflare (`wrangler login` / `cf` o token de API con permisos mínimos: Pages, Workers, R2, Workers AI lectura, Turnstile) | Despliegue, R2, Turnstile | Alejandro | `wrangler login` interactivo, o token en `.env` por él | Fase 1–2 |
| Neon: sesión `neonctl auth` o API key | Crear proyecto y ramas, migraciones | Alejandro | Interactivo o `.env` por él | Fase 2 |
| `DATABASE_URL` (staging/prod, rama separada) | API | Claude lo obtiene con la sesión de Neon | `wrangler pages secret put` | Fase 2 |
| Turnstile (site key pública + secret key) | Anti-bots en pedido/reserva | Alejandro crea el widget en el panel de Cloudflare (o Claude con `cf`/`wrangler` si tiene permiso) | Secret key por `wrangler secret put`; site key va pública | Fase 4 |
| `SESSION_SECRET` / clave de JWT | Firmar sesiones | Claude genera con `openssl` | `wrangler secret put` sin imprimir | Fase 2 |
| Bucket R2 + credenciales S3 (si se usan firmadas) o *binding* | Fotos y videos | Claude con Wrangler; Alejandro autoriza | Binding en `wrangler.toml` | Fase 5 |
| Primera contraseña de administrador | Entrar al panel | **La persona que la usará** | `pnpm tsx scripts/create-admin.ts` (pide por terminal) | Fase 5 |
| Token de bot de Telegram (BotFather) y `chat_id` | Avisos (opcional) | Alejandro crea el bot | `wrangler secret put TELEGRAM_BOT_TOKEN` | Fase 9 (opc.) |
| Dominio y DNS | URL pública | **Alejandro** compra y delega el DNS a Cloudflare | Claude indica los registros | Fase 12 |
| Cuenta del restaurante en Cloudflare/Neon/GitHub | Producción | Alejandro / el restaurante | Todo se recrea con secretos nuevos | Fase 12 |

## 13.3 Archivo `.env.example` (mantener al día)

```
APP_ENV=development            # development | staging | production
PUBLIC_BASE_URL=http://localhost:4321
DATABASE_URL=
SESSION_SECRET=
TURNSTILE_SITE_KEY=
TURNSTILE_SECRET_KEY=
R2_BUCKET=
PUBLIC_MEDIA_BASE_URL=
RATE_LIMIT_SALT=
TELEGRAM_BOT_TOKEN=            # opcional
TELEGRAM_CHAT_ID=              # opcional
PUBLIC_CF_ANALYTICS_TOKEN=     # opcional, público
```
Ningún host (dominio, URL de API) se escribe en el código: sale del entorno.

---

