# Pendientes

> Datos, decisiones y tareas manuales que faltan. Claude Code lo mantiene al día. Marcar con fecha cuando se resuelva.

## Datos del restaurante (los entrega Alejandro)

- [ ] Menú real: categorías, productos, descripciones, precios y opciones (adicionales, "sin cebolla", tamaños, combos).
- [ ] Fotos de los productos y, si existe, un video del restaurante.
- [ ] Logo original en alta resolución o vectorial (hoy solo hay `assets/logo-360.jpg`, de 360 px).
- [ ] Número de WhatsApp que recibe pedidos y reservas.
- [ ] Dirección exacta, enlace de ubicación, teléfono de contacto y redes sociales (Facebook: https://www.facebook.com/share/1Dd3b6a6uF/).
- [ ] Horarios por día y festivos.
- [ ] Costo de domicilio, domicilio gratis desde cierto monto (¿sí/no?), pedido mínimo, zonas atendidas.
- [ ] Datos para transferencias (banco, Nequi, Daviplata; titular y número).
- [ ] Motivos de "no entregado" y plantillas de mensajes (o aprobar las propuestas).
- [ ] Reservas: mesas o capacidad por franja, anticipación mínima y máxima, tamaño máximo de grupo.
- [ ] Textos: "Quiénes somos", eslogan.

## Decisiones abiertas

- [ ] Dominio del sitio y quién lo compra.
- [ ] Región de la base de datos (o D1 como alternativa) — se decide con mediciones en la Fase 2.
- [ ] Módulos opcionales: resumen diario, aviso por Telegram/notificaciones, asistente con IA, confirmación automática por WhatsApp Business API (con costo).
- [ ] Zonas de domicilio con costos distintos (¿sí/no?).
- [ ] Pedidos programados (¿sí/no?) y recoger en el local (¿sí/no?).
- [ ] Permisos de despliegue a staging (Q-0.7).
- [ ] Titularidad final de las cuentas de producción.

## Tareas manuales de Alejandro

- [ ] Instalar herramientas (`setup/PREREQUISITOS.md`) y ejecutar `bash setup/check-env.sh`.
- [ ] Iniciar sesión en `gh`, `wrangler` y `neonctl` (Fase 1–2).
- [ ] Crear el widget de Turnstile (Fase 4) o autorizar a Claude Code a crearlo con su sesión.
- [ ] Crear su usuario administrador con `scripts/create-admin.ts` (Fase 5).
- [ ] Revisar y validar con asesoría legal la política de privacidad y los términos (Fase 3/10).
- [ ] Comprar el dominio y delegar el DNS (Fase 12).
- [ ] Crear las cuentas de producción del restaurante (Fase 12).
