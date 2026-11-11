# 20. Riesgos y decisiones abiertas

| Riesgo | Mitigación |
|---|---|
| Latencia de Neon desde el borde (≈ 1,25 s medidos antes) | Sección 6.3: región, Smart Placement, una sola transacción, caché para lecturas, plan B con D1 |
| El cliente no envía el mensaje de WhatsApp | El pedido ya está guardado y visible en el panel; resaltado de pedidos sin confirmar; el admin puede escribirle |
| Pedidos falsos o bromas | Turnstile, límites de frecuencia, estado `SOLICITADO` que no cuenta como venta, el admin confirma por WhatsApp si dudan |
| El domiciliario marca "pagado" sin cobrar | Auditoría, cierre de caja con diferencia, el admin puede revisar y corregir con motivo |
| Transferencia falsa | El admin verifica en su banco antes de "Verificar pago"; el domiciliario no confirma transferencias |
| Fotos o videos pesados | Reducción en el navegador, variantes, límites de tamaño, `preload="metadata"` |
| Cambio de límites de planes gratuitos | `docs/COSTOS.md` con fecha y plan B; no depender de un único proveedor (interfaces `Storage`/`Notifier`) |
| Cumplimiento legal de datos personales | Borrador de políticas, consentimiento, retención; validación con asesoría legal (a cargo de Alejandro) |
| Dominio/DNS por terceros | Alejandro lo gestiona; entregar guía de registros |
| Cuentas personales en producción por error | Regla 0.3: nada personal a producción; checklist en `docs/DESPLIEGUE.md` |
| Conectividad pobre en San Juan de Arama | Móvil primero, peso mínimo, PWA con cola de acciones, reintentos |
| Alcance que crece | Todo cambio de alcance pasa por DEC y por Alejandro |

**Decisiones abiertas a cerrar en la Fase 0/1:** dominio; región de Neon (o D1); cuáles módulos opcionales; si hay zonas de domicilio con costos distintos; pedidos programados; uso del *deploy hook* para la instantánea del menú; titularidad final de cuentas.

---

