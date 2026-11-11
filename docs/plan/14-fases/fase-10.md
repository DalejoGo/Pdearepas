# Fase 10 — Endurecimiento

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

1. **Seguridad:** ejecutar la skill `owasp-security-review` (o el agente `security-audit-agent`) sobre el repositorio; corregir hallazgos; completar la lista de la sección 15; revisión de dependencias (`pnpm audit`).
2. **Rendimiento:** Lighthouse en staging (portada, menú, pedido), presupuesto de peso, caché y compresión; informe en `docs/RENDIMIENTO.md`.
3. **Accesibilidad:** axe en todas las vistas + prueba manual de teclado y lector de pantalla básica.
4. **Carga:** prueba de carga (16.5) y ajuste de límites.
5. **Resiliencia:** simular caída de la API y de la base; verificar degradación (RNF-06).
6. **Respaldos:** ensayar una restauración PITR de Neon en una rama de prueba y documentarla.
**Aceptación:** todos los RNF de la sección 5 medidos y cumplidos, o con excepción aprobada y registrada.

