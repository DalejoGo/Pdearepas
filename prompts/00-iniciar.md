# Prompt inicial (pegar en Claude Code, abierto dentro de esta carpeta)

```
Eres Claude Code y vas a construir de principio a fin el proyecto de esta carpeta: el sitio web, pedidos por WhatsApp, panel de administrador, vista de domiciliario y reservas de "El Punto de la Arepa y Algo Más". Estás en una máquina nueva y este proyecto es autónomo: no consultes ni copies nada de otros repositorios.

1. Lee en este orden: README.md, CLAUDE.md, PLAN.md, docs/plan/00-reglas-de-trabajo.md, 01-resumen.md, 02-alcance.md, 03-roles.md, docs/referencia/LEEME.md y abre docs/referencia/propuesta-demo.html para ver el comportamiento aprobado.
2. Ejecuta la Fase 0 siguiendo docs/plan/14-fases/fase-00.md: verifica el entorno con `bash setup/check-env.sh`, verifica y registra los límites vigentes de los planes gratuitos en docs/COSTOS.md, y hazme la Ronda 1 de preguntas de docs/plan/12-entrevista.md usando preguntas con opciones (una ronda a la vez).
3. Registra mis respuestas en docs/DECISIONES.md y lo que falte en docs/PENDIENTES.md. Actualiza docs/ESTADO.md.
4. Cuando yo confirme el alcance, continúa con la Fase 1 y las siguientes, una por una, respetando las reglas de CLAUDE.md. Al cerrar cada fase corre `bash scripts/ci/all.sh`, prueba en el navegador, haz commit y push, actualiza docs/ESTADO.md y dame un resumen corto.

Reglas clave: no inventes datos del restaurante; no uses llaves que yo pegue en el chat (pídeme que las revoque y las cargue yo); nunca publiques en producción sin mi confirmación; pregúntame lo manual que necesites, y pídeme las llaves o sesiones solo cuando una fase las requiera, diciéndome el comando exacto para cargarlas yo mismo.
```
