# Fase 2 — Datos y núcleo de API

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

**Objetivo:** base de datos, migraciones, semilla, autenticación y reglas de negocio puras probadas.
1. Implementar el esquema Drizzle de la sección 7; generar la migración inicial; aplicarla en Postgres local; pruebas de integración con **PGlite**.
2. Crear el proyecto Neon de **staging** (rama separada para pruebas) con la sesión de Alejandro; **medir latencia** (sección 6.3) con `scripts/measure-latency.ts` en ≥ 30 muestras y **elegir región**; documentar en `docs/RENDIMIENTO.md`. Si el p95 es alto, abrir DEC sobre D1.
3. `packages/domain`: `totals.ts`, `orderStateMachine.ts`, `validSale.ts`, `hours.ts` (abierto/cerrado), `phone.ts`, `messages.ts`, con **pruebas unitarias exhaustivas** (casos límite: medianoche, domicilio gratis, opciones obligatorias, transiciones inválidas, teléfonos mal escritos).
4. `packages/contracts`: esquemas Zod de entradas/salidas y de errores.
5. Autenticación: hash de contraseña, login con bloqueo por intentos, sesiones con revocación, middleware RBAC (`requireRole`), `scripts/create-admin.ts` (interactivo).
6. `scripts/seed.ts` + `content/seed.json` con el menú de ejemplo de la demo marcado `EJEMPLO`.
7. Middleware: IDs de solicitud, logs estructurados, manejo uniforme de errores, cabeceras de seguridad, límites de tamaño de cuerpo.
**Aceptación:** cobertura ≥ 80 % en `domain`; pruebas de autorización por rol; migración aplicada en staging; informe de latencia con decisión sobre región/D1.
**Paralelizable:** `domain` (lógica) y `auth` (seguridad) y `schema` pueden hacerse por agentes distintos con archivos separados.

