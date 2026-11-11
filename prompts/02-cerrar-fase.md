# Lista para cerrar una fase (Claude Code la sigue al terminar cada fase)

1. Todos los criterios de **Aceptación** de la ficha de la fase se cumplen y están probados.
2. `bash scripts/ci/all.sh` en verde (lint, tipos, pruebas, build). Fase 1 en adelante.
3. Flujo probado en navegador real, 360 px y escritorio, claro y oscuro (fases con interfaz).
4. Sin secretos en el código ni en el historial (`git log -p` sin llaves); `.env.example` al día.
5. Medidas de rendimiento relevantes anotadas en `docs/RENDIMIENTO.md`.
6. `docs/DECISIONES.md` con las decisiones nuevas, `docs/PENDIENTES.md` con lo que falta, `docs/ESTADO.md` con la fase marcada como terminada y la fecha.
7. Commit (Conventional Commits) y push; CI de GitHub en verde.
8. Despliegue a staging solo si Alejandro lo autorizó; producción solo con su confirmación explícita.
9. Resumen corto a Alejandro: qué se hizo, qué se decidió, qué falta, qué sigue.
