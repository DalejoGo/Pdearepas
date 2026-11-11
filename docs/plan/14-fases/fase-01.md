# Fase 1 — Cimientos del repositorio

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

**Objetivo:** monorepo funcionando con CI local en verde.
1. `git init`, rama `main`, repositorio privado en GitHub bajo la cuenta indicada en Q-0.4 (`gh repo create ... --private`).
2. Crear el monorepo: `pnpm-workspace.yaml`, `turbo.json`, `biome.json`, `tsconfig` base, `packages/{contracts,domain,config,ui}`, `apps/{web,edge}`. Fijar versiones exactas. Versiones de referencia usadas en otro proyecto en noviembre de 2026 (verificar vigencia y la regla de 14 días con `pnpm view <paquete> version time`): Node ≥ 22.12 (LTS 22 o 24), pnpm 10.26.1, TypeScript 5.9.3, Biome 2.5.15, Turbo 2.11.7, Vitest 5.0.3, Astro 7.3.8, Preact 10.29.8.
3. `docker-compose.yml` con Postgres local; `.env.example`; `.gitignore` (incluye `.env`, `.dev.vars`, `.wrangler`).
4. Scripts: `scripts/ci/all.sh` (lint, tipos, pruebas, build), `scripts/ci/push.sh` (push y espera del CI con `gh run watch`; **no** usar `gh ... 2>/dev/null` en bucles, porque oculta fallos).
5. Workflow de GitHub Actions: instalar, `pnpm ci`, Playwright (instalar navegadores), subir reportes.
6. `CLAUDE.md` con las reglas de la sección 0 (versión corta) y comandos.
7. Registrar DEC de: stack, caché del menú (9.6), manejo de cuentas (0.3).
8. Primera página "Hola" en Astro y primera ruta `/api/health` en Hono, con una prueba cada una.
**Aceptación:** `pnpm install && bash scripts/ci/all.sh` en verde en limpio; CI de GitHub verde; la web y la API arrancan con `pnpm dev`.
**Paralelizable:** configuración de CI y `packages/*` (agentes con alcances distintos).

