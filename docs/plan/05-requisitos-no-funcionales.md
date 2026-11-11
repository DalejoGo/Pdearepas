# 5. Requisitos no funcionales

| ID | Categoría | Requisito | Cómo se verifica |
|---|---|---|---|
| RNF-01 | Rendimiento (público) | Lighthouse móvil ≥ 90 en Rendimiento; LCP ≤ 2,5 s y CLS < 0,1 y INP ≤ 200 ms con red 4G lenta simulada | `pnpm audit` (Lighthouse) en CI sobre staging |
| RNF-02 | Peso | JS inicial de la portada ≤ 90 KB gzip; imágenes responsivas WebP/AVIF; fuentes con `font-display: swap`, subconjunto latino | Presupuesto de peso en CI |
| RNF-03 | Latencia API | `GET /api/menu` desde caché < 150 ms p95; `POST /api/orders` < 2,5 s p95 incluyendo base de datos; acciones de panel < 1,5 s p95 | Prueba de carga y logs |
| RNF-04 | Demos rápidas | Ninguna pantalla debe esperar arranques en frío de servidores dormidos. Nada de planes gratuitos que "duermen" | Revisión de arquitectura |
| RNF-05 | Escalabilidad | Soportar 500 pedidos/día y 50 usuarios concurrentes con holgura 10x sin cambios de arquitectura; crecer a otras sucursales sin reescribir (campo `location_id`) | Prueba de carga (sección 16.5) |
| RNF-06 | Disponibilidad | Objetivo 99,9 % (lo que ofrecen Cloudflare y Neon); degradación elegante: si la API cae, el menú cacheado se sigue viendo y se ofrece "Pedir por WhatsApp" directo | Prueba de fallo simulada |
| RNF-07 | Seguridad | OWASP Top 10:2025 sin hallazgos altos ni críticos; CSP estricta sin `unsafe-inline`/`unsafe-eval`; cookies `HttpOnly; Secure; SameSite=Lax`; contraseñas con hash lento; datos personales mínimos | Revisión con la skill `owasp-security-review` + pruebas de seguridad |
| RNF-08 | Privacidad | Cumplir Ley 1581 de 2012: aviso, consentimiento, finalidad, derecho a supresión, retención limitada | Lista de verificación legal |
| RNF-09 | Accesibilidad | WCAG 2.2 AA: contraste, foco visible, teclado, etiquetas, `prefers-reduced-motion`, tamaños táctiles ≥ 44 px | `axe` con Playwright en CI + revisión manual |
| RNF-10 | Compatibilidad | Últimas 2 versiones de Chrome, Safari, Firefox, Edge; Android Chrome 100+ con 2 GB de RAM; iOS Safari 15+; pantallas desde 360 px | Playwright con proyectos móviles |
| RNF-11 | Móvil primero | Diseño pensado para celular; sin scroll horizontal de página; gutter ≥ 16 px | Pruebas visuales |
| RNF-12 | Resiliencia de red | Carrito y formulario conservan datos; reintentos con *backoff* en envío; mensajes de error claros cuando no hay conexión | Prueba con red limitada |
| RNF-13 | Consistencia de datos | Totales calculados **siempre en el servidor**; creación de pedido en una transacción; idempotencia; estados solo por transiciones válidas | Pruebas unitarias e integración |
| RNF-14 | Auditabilidad | Toda acción sensible queda en `order_events`/`audit_log` (inmutables) con actor, hora y diferencia | Pruebas |
| RNF-15 | Observabilidad | Logs estructurados con ID de solicitud; errores no controlados capturados; métricas básicas (pedidos/hora, errores 5xx, latencia) | Revisión en staging |
| RNF-16 | Respaldo y recuperación | Restauración a un punto en el tiempo (PITR) de Neon; exportación semanal de pedidos a archivo en R2; **RPO ≤ 24 h, RTO ≤ 4 h**; restauración ensayada una vez | Ensayo documentado |
| RNF-17 | Mantenibilidad | TypeScript estricto; contratos Zod compartidos web↔API; cobertura ≥ 80 % en lógica de negocio (totales, estados, mensajes, validaciones); Biome sin avisos | CI |
| RNF-18 | Costo | Costo fijo mensual objetivo **$0** al lanzar usando planes gratuitos (Cloudflare, Neon). Registrar en `docs/COSTOS.md` los límites de cada plan y qué pasa al superarlos. Dominio es gasto aparte | Revisión |
| RNF-19 | Portabilidad | Sin acoplarse a un proveedor: acceso a datos por Drizzle, archivos detrás de una interfaz `Storage`, mensajería detrás de una interfaz `Notifier` | Revisión de código |
| RNF-20 | Internacionalización | Solo `es-CO` en v1, pero con textos en diccionario, formato de moneda/fecha con `Intl` | Revisión |
| RNF-21 | Entrega | Documentación suficiente para que otra persona opere y mantenga: README, manual del administrador y del domiciliario, runbook de operación | Revisión |

> Los límites de los planes gratuitos cambian. **Verificar los límites vigentes de Cloudflare (Pages/Workers, R2, Workers AI, Turnstile) y Neon en su documentación oficial en la Fase 0 y registrarlos con fecha** en `docs/COSTOS.md`. No dar por buenas las cifras de memoria.

---

