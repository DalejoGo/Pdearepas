# 17. Cómo usar agentes en paralelo

Reglas: alcance de archivos explícito por agente, sin solapes; cada uno corre sus propias pruebas; el agente principal integra y corre `all.sh`.

| Fase | Agentes sugeridos (alcance) |
|---|---|
| 1 | A: CI/Actions y scripts · B: `packages/*` y configuración base |
| 2 | A: esquema+migraciones+semilla · B: `domain` y pruebas · C: auth+RBAC |
| 3 | A: `packages/ui` y tokens · B: páginas legales y SEO · C: API de menú y caché |
| 5 | A: pedidos del panel · B: menú+medios · C: ajustes+usuarios |
| 10 | A: seguridad (`security-audit-agent`) · B: rendimiento · C: accesibilidad |

Los agentes de revisión **no** reciben la conclusión del autor, solo el código.

---

