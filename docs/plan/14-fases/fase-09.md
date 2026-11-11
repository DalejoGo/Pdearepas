# Fase 9 — Automatizaciones y asistente IA (solo lo aprobado en Q-0.8)

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

1. **Resumen diario:** Cron Trigger al cierre → mensaje (Telegram/correo) con ventas válidas, pedidos, cancelados, efectivo por domiciliario. Tabla `jobs_outbox` con reintentos.
2. **Aviso de pedido/reserva nueva:** Telegram (o web push) con el código y el total.
3. **Respaldo semanal:** exportación de pedidos a R2.
4. **Asistente con IA:** endpoint que responde **solo** con el menú y los ajustes públicos como contexto (sin acceso a datos de clientes), con tope diario de mensajes, filtros de tema, Turnstile y opción siempre visible de "Pedir por WhatsApp". Probar que no inventa precios (evaluación con preguntas de prueba) y que respeta el límite.
5. **Confirmación automática por WhatsApp Business API:** solo si Alejandro la aprueba tras ver el costo; requiere cuenta Meta Business, número verificado y plantillas aprobadas.
**Aceptación:** cada módulo con pruebas y con interruptor en Ajustes; ninguno bloquea el flujo principal si falla (degradación elegante).

