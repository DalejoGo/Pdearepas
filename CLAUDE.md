# CLAUDE.md — El Punto de la Arepa y Algo Más

Proyecto **nuevo y autónomo**: no hay otro repositorio, carpeta ni memoria previa que consultar. Todo lo necesario está en esta carpeta. Plan completo en `PLAN.md` y `docs/plan/`. Avance en `docs/ESTADO.md`.

## Quién es el usuario

Alejandro, de AIM Desarrollo y Automatizaciones. Conversar con él **en español**, llamarlo Alejandro. El cliente final es El Punto de la Arepa y Algo Más (San Juan de Arama, Meta, Colombia).

## Reglas no negociables

1. **Planear antes de construir y trabajar por fases.** Una fase se cierra solo cuando todos sus criterios de aceptación pasan y `bash scripts/ci/all.sh` está en verde (el script se crea en la Fase 1). Leer solo la ficha de la fase actual (`docs/plan/14-fases/fase-NN.md`) y las secciones del plan que cite.
2. **Retomar:** al empezar, leer `docs/ESTADO.md` y `docs/PENDIENTES.md`; al cerrar una fase, actualizarlos y hacer un resumen corto a Alejandro (qué se hizo, qué se decidió, qué falta).
3. **Preguntar en estilo entrevista** cuando falte información: preguntas con opciones (`AskUserQuestion`), una ronda a la vez, la opción recomendada primero. Las rondas están en `docs/plan/12-entrevista.md`. **Nunca suponer** datos del restaurante (precios, productos, números, cuentas bancarias, horarios, direcciones). Si faltan, usar un valor `EJEMPLO` editable y anotarlo en `docs/PENDIENTES.md`.
4. **Agentes en paralelo** cuando el trabajo se pueda repartir sin que se pisen los archivos (`docs/plan/17-agentes-en-paralelo.md`). Cada agente recibe un alcance de archivos explícito. Los agentes de revisión no reciben la conclusión del autor, solo el código.
5. **Usar librerías probadas** en lugar de reinventar lógica (validación, fechas, teléfonos, hashing).
6. **Todo editable fuera del código:** precios, productos, textos, horarios, domicilio, WhatsApp y datos de pago viven en la base de datos (editables desde el panel) o en `content/seed.json`. Nunca incrustados en componentes. Ningún host escrito en el código: sale del entorno.
7. **Secretos:** jamás en el código, commits, logs ni chat. Todo secreto nuevo se documenta en `.env.example`. **Si Alejandro pega una llave en el chat, no usarla:** pedirle que la revoque, cree otra y la cargue él con el comando indicado. Las contraseñas de usuarios las escribe cada persona por terminal (`scripts/create-admin.ts`).
8. **Versiones exactas** en `package.json` y nada publicado hace menos de 14 días, salvo parche de seguridad (se registra en `docs/DECISIONES.md`).
9. **Decisiones** que cambien el plan o la arquitectura se escriben en `docs/DECISIONES.md` (DEC-NNN) antes de aplicarse.
10. **Código e identificadores en inglés; textos visibles en español de Colombia**, en un diccionario (no sueltos en componentes). Dinero en pesos enteros (COP); hora visible en `America/Bogota`, guardada en UTC.
11. **Conventional Commits.** Commits pequeños. Antes de cada commit: `bash scripts/ci/all.sh` en verde.
12. **Medir, no suponer.** Cada requisito de rendimiento se mide y el número queda en `docs/RENDIMIENTO.md`. Los límites de planes gratuitos se verifican en la documentación oficial y se registran con fecha en `docs/COSTOS.md`.
13. **Demos y pantallas rápidas:** nada que dependa de servidores que se duermen o arranques en frío largos.
14. **Probar de verdad:** para cada fase con interfaz, levantar en `localhost` y probar el flujo en un navegador real (móvil y escritorio, claro y oscuro). Pasar las pruebas no basta.

## Permisos de despliegue (valores por defecto; se confirman en la Fase 0, pregunta Q-0.7)

| Acción | Por defecto |
|---|---|
| `git commit` y `git push` con CI en verde | Sin preguntar |
| Migraciones en **staging** con CI en verde | Sin preguntar |
| Despliegue a **staging** | Solo cuando Alejandro lo pida; mostrar primero en `localhost` |
| Despliegue y migraciones en **producción** | **Siempre confirmación explícita** |
| Crear cuentas, pagar, comprar dominio, manejar llaves | Siempre lo hace Alejandro |

## Cuentas

Las cuentas usadas durante el desarrollo son **temporales y solo para staging**. **Nada de lo personal llega a producción.** Producción se recrea desde cero en las cuentas del restaurante con secretos nuevos; nunca se copian ni "transfieren" valores entre cuentas (lista en `docs/DESPLIEGUE.md`).

## Herramientas

Si un CLI (`gh`, `wrangler`, `neonctl`) no está en el `PATH`, localizarlo con `which` o ver `setup/PREREQUISITOS.md`. No ocultar errores con `2>/dev/null` dentro de bucles de espera.

## Comandos (se completan en la Fase 1)

```bash
pnpm install
pnpm dev                    # web + API
bash scripts/ci/all.sh      # lint, tipos, pruebas, build
```
