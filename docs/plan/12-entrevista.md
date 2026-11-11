# 12. Información que Claude Code debe pedirle a Alejandro (entrevista)

Hacer **una ronda por vez** con `AskUserQuestion`. Si Alejandro no sabe algo todavía, registrar el pendiente en `docs/PENDIENTES.md` y continuar con un valor `EJEMPLO` editable.

## Ronda 1 — Fase 0 (antes de escribir código)

- **Q-0.1 Nombre y dominio.** ¿Nombre final del sitio y dominio? (opciones: ya tienen dominio / lo compra Alejandro / usar subdominio gratuito de Cloudflare mientras tanto — recomendado). *Alejandro compra el dominio y apunta el DNS; Claude Code guía los pasos.*
- **Q-0.2 Menú real.** ¿Cómo entrega el menú? (fotos del menú / lista en texto / hoja de cálculo). Recibir: categorías, productos, descripción, precio, opciones (adicionales, "sin cebolla", tamaños, combos), cuáles destacar. Formato sugerido: `Categoría | Producto | Descripción | Precio | Opciones`.
- **Q-0.3 Fotos y videos.** ¿Quién las toma o las entrega? ¿Ya tienen algunas? ¿Hay un video del restaurante?
- **Q-0.4 Cuentas.** Confirmar qué cuentas se usan (GitHub, Cloudflare, Neon) y que son **temporales y solo para staging**, y cómo se hará el traspaso a las cuentas del restaurante antes de producción (¿quién será titular?).
- **Q-0.5 Negocio.** WhatsApp que recibe pedidos (número real), dirección exacta del local, horarios por día, festivos, teléfono de contacto, redes sociales, enlace de ubicación en Maps.
- **Q-0.6 Reglas de domicilio.** Costo fijo de domicilio, ¿gratis desde cierto monto?, ¿pedido mínimo?, ¿zonas o barrios atendidos?, ¿hay cobro de domicilio distinto por zona? (v1 usa un valor único; si hay zonas, abrir DEC).
- **Q-0.7 Permisos de despliegue.** ¿Desplegar a staging al cerrar cada fase sin preguntar, o solo cuando lo pida? (por defecto: solo cuando lo pida; mostrar en `localhost`).
- **Q-0.8 Opcionales.** ¿Cuáles de estos se construyen ahora? Resumen diario, aviso al celular del dueño (Telegram), asistente con IA, confirmación automática por WhatsApp Business API (con costo).
- **Q-0.9 Marca.** Logo original en alta resolución (o vectorial), colores oficiales si existen, textos de presentación ("Quiénes somos"), eslogan.

## Ronda 2 — Antes de la Fase 4 (pedidos)

- **Q-4.1** Datos para transferencias (banco/Nequi/Daviplata, titular, número). *Se cargan por el panel o por script interactivo; no se escriben en el chat si Alejandro prefiere no hacerlo.*
- **Q-4.2** Motivos de "no entregado" que quieren en la lista.
- **Q-4.3** ¿Ofrecen recoger en el local? ¿Pedidos programados para otra hora?
- **Q-4.4** Texto de las plantillas de mensajes (o aprobar las propuestas).

## Ronda 3 — Antes de la Fase 5/6 (usuarios)

- **Q-5.1** Nombres de usuario y personas: administradores y domiciliarios (cuántos). Las **contraseñas iniciales las define cada persona** con `scripts/create-admin.ts` (la pide por terminal); nunca se envían por el chat.

## Ronda 4 — Antes de la Fase 7 (reservas)

- **Q-7.1** Número de mesas/capacidad por franja, anticipación mínima y máxima, tamaño máximo de grupo, horario de reservas.

## Ronda 5 — Antes de la Fase 11/12 (lanzamiento)

- **Q-11.1** Personas que participarán en la capacitación y la prueba con pedidos reales.
- **Q-12.1** Titularidad final de las cuentas de producción, dominio definitivo, quién recibe alertas.
- **Q-12.2** Aprobación **explícita** para publicar en producción.

---

