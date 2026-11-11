# Prerrequisitos de la máquina nueva

Instalar lo siguiente (Linux, macOS o Windows con WSL2). Después ejecutar `bash setup/check-env.sh`.

| Herramienta | Versión | Para qué | Cómo instalarla |
|---|---|---|---|
| **Claude Code** | la más reciente | Ejecutar el proyecto | Ver la documentación oficial de Claude Code |
| **Node.js** | ≥ 22.12 (LTS 22 o superior) | Todo el monorepo | `nvm install --lts` o el instalador oficial de Node |
| **pnpm** | 10.x | Gestor de paquetes | `corepack enable && corepack prepare pnpm@10 --activate` |
| **git** | cualquiera reciente | Control de versiones | Paquete del sistema |
| **GitHub CLI (`gh`)** | reciente | Repositorio y CI | Sitio oficial de GitHub CLI; en Linux con snap queda en `/snap/bin/gh` |
| **Wrangler** | reciente | Cloudflare (Pages, R2, secretos) | Se usa con `pnpm dlx wrangler` o `npm i -g wrangler` |
| **neonctl** | reciente | Neon (base de datos) | `npm i -g neonctl` |
| **Docker** (opcional) | reciente | Postgres local | Docker Desktop o Docker Engine. Alternativa sin Docker: PGlite para pruebas y la base de Neon (rama de desarrollo) |
| **Navegador Chromium/Chrome** | reciente | Pruebas con Playwright y revisión visual | Playwright lo descarga con `pnpm exec playwright install --with-deps chromium` (Fase 1) |
| **openssl** | cualquiera | Generar secretos | Paquete del sistema |

## Cuentas necesarias (gratis para empezar)

| Cuenta | Para qué | Quién la crea |
|---|---|---|
| GitHub | Repositorio privado y CI | Alejandro |
| Cloudflare | Hosting, API, R2, Turnstile, Workers AI | Alejandro |
| Neon | Base de datos Postgres | Alejandro |
| Registrador de dominio | Dominio del sitio (más adelante, Fase 12) | Alejandro |
| Telegram (solo si se aprueba el aviso) | Bot de avisos | Alejandro |

## Inicio de sesión (lo hace Alejandro, de forma interactiva)

```bash
gh auth login
npx wrangler login
neonctl auth
```
No se pegan tokens en el chat. Si algún paso exige un token de API, Alejandro lo crea con permisos mínimos y lo guarda él mismo en `.env` (ignorado por git).

## Si algo falla

- `command not found: gh` → revisar el `PATH` o usar la ruta completa (`which gh`).
- `node` con versión distinta → usar `nvm use 22`.
- Sin Docker → pedir a Claude Code que use PGlite para pruebas y una rama de desarrollo de Neon para la base local.
