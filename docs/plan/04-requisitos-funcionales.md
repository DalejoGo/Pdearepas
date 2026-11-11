# 4. Requisitos funcionales

Formato: `RF-xx` (requisito) con criterios de aceptación (CA) verificables. **Prioridad:** M = obligatorio v1, S = debería (v1 si hay tiempo), O = opcional.

## 4.1 Sitio público

**RF-01 (M) Inicio.** Portada con banners/promociones (carrusel desplazable), productos destacados, video del restaurante (si existe), horario, dirección y botón de WhatsApp.
- CA: los banners, destacados y video salen de la base de datos; si no hay video no se muestra el bloque; el estado "abierto/cerrado" se calcula con los horarios configurados y la zona horaria `America/Bogota`.

**RF-02 (M) Menú.** Productos agrupados por categoría, con chips de categoría fijos arriba al desplazar, foto, nombre, descripción, precio y botón "Agregar".
- CA: productos desactivados no se pueden agregar y se muestran como "Agotado" (o se ocultan, según ajuste `hide_unavailable`); precios formateados en pesos colombianos sin decimales (`$16.000`); búsqueda por texto opcional (S).

**RF-03 (M) Opciones de producto (modificadores).** Un producto puede tener grupos de opciones: **obligatorias o no, de elección única o múltiple, con mínimo/máximo y con costo adicional** (ej. "Adicionales: queso extra +$2.000", "Quitar: cebolla, tomate", "Bebida: gaseosa o jugo"). Campo de nota libre por producto en el carrito (S).
- CA: el servidor valida mínimos/máximos y recalcula el precio; una opción inválida rechaza el pedido con error claro.

**RF-04 (M) Carrito.** Agregar, quitar, cambiar cantidad; persiste en el navegador (`localStorage` con respaldo si no está disponible); barra flotante con cantidad y total; se limpia al enviar el pedido. Si un producto cambió de precio o dejó de estar disponible entre que se agregó y se envió, se avisa y se actualiza.
- CA: recargar la página conserva el carrito; el total mostrado siempre coincide con el que calcula el servidor.

**RF-05 (M) Pedido.** Datos: nombre, teléfono, tipo de entrega (**domicilio** o **recoger en el local**), dirección y referencia (solo domicilio), forma de pago (**transferencia** o **efectivo al entregar**), con cuánto paga (opcional, solo efectivo), nota. Resumen con subtotal, domicilio y total.
- CA: validación de teléfono colombiano (10 dígitos, móvil inicia en 3, se normaliza a +57); campos obligatorios claros; mensajes de error junto al campo; no se puede enviar con carrito vacío, con el local cerrado (si `allow_orders_when_closed=false`) ni por debajo del pedido mínimo (si está configurado).

**RF-06 (M) Envío a WhatsApp.** Al enviar, el **servidor** crea el pedido en estado `SOLICITADO`, genera el código (`#0042`), construye el mensaje con el formato de la sección 10.1 y devuelve un enlace `https://wa.me/<numero>?text=<mensaje>`. El navegador lo abre. Si el navegador bloquea la ventana, se muestra un botón grande "Abrir WhatsApp" y se ofrece "Copiar mensaje".
- CA: el mensaje incluye código, nombre, teléfono, dirección, productos con cantidades y opciones, subtotal, domicilio, **valor total**, forma de pago y nota; el pedido queda guardado **aunque el cliente no envíe el mensaje** (el panel es la fuente de verdad); reintentar el envío no duplica el pedido (idempotencia, ver 9.3).

**RF-07 (M) Confirmación y seguimiento.** Tras enviar, el cliente ve una página con su código, resumen y el estado actual, accesible por un enlace con token no adivinable (`/pedido/<token>`), que se actualiza sola cada 10–15 s. Si paga por transferencia y el pedido ya fue confirmado, se muestran los **datos para transferir** (de los ajustes).
- CA: el token tiene al menos 128 bits de entropía; la página no expone datos de otros pedidos ni el teléfono completo (se enmascara); el estado se muestra en lenguaje claro.

**RF-08 (M) Reservas.** Formulario: nombre, teléfono, fecha, hora, número de personas, nota. Franjas generadas desde el horario de atención (cada 30 min), anticipación mínima y máxima configurables (por defecto 2 h y 30 días), grupos grandes (más de 12) se piden por WhatsApp. Capacidad por franja opcional (S).
- CA: se guarda como `PENDIENTE`, se envía mensaje a WhatsApp (formato 10.2), el administrador la confirma o rechaza; no se aceptan fechas pasadas ni fuera de horario.

**RF-09 (M) Contacto, ubicación y horarios.** Dirección, mapa (enlace a Google Maps, **sin** iframe de terceros por CSP), horarios por día, redes sociales (Facebook), botón de WhatsApp.

**RF-10 (M) Páginas legales.** Política de privacidad (Ley 1581 de 2012, Colombia) y términos del servicio, con casilla de aceptación en el pedido y la reserva. *Redactar borrador; Alejandro debe validarlo con asesoría legal.*

**RF-11 (S) Estado "cerrado".** Si el local está cerrado, el sitio lo dice claramente y bloquea o permite pedidos programados, según ajuste.

**RF-12 (S) SEO local.** Metadatos, Open Graph, `sitemap.xml`, `robots.txt`, JSON-LD `Restaurant` con horarios y menú, título y descripción por página, URLs limpias en español.

## 4.2 Administrador

**RF-20 (M) Autenticación.** Inicio de sesión con usuario y contraseña; cierre de sesión; cambio de contraseña; bloqueo temporal tras intentos fallidos; sesión con vencimiento (8 h inactividad admin, 30 días "recordar este dispositivo" para domiciliario); revocación de sesiones al desactivar un usuario.

**RF-21 (M) Gestión de pedidos.**
- Lista en tiempo casi real (consulta cada 8–10 s con cursor `since`) con **sonido y contador en el título** al llegar un pedido nuevo.
- Filtros por estado, fecha, domiciliario y forma de pago; búsqueda por código, nombre o teléfono.
- Acciones según estado (tabla de transiciones en 8.2): **Confirmar** (exige domiciliario si es domicilio), **Asignar/reasignar domiciliario**, **Verificar pago** (transferencia), **Cancelar** (con motivo), **Reabrir un "no entregado"** (vuelve a confirmado para reasignar), **Marcar entregado** (override del administrador, exige motivo y queda en auditoría).
- Botones "Avisar al cliente por WhatsApp" con mensaje prellenado (confirmado, en camino, datos para transferir, cancelado).
- Pedidos en `SOLICITADO` por más de N minutos (por defecto 30) se resaltan.
- CA: toda acción registra quién, cuándo y qué cambió en `order_events` (inmutable).

**RF-22 (M) Ventas válidas y cierre de caja.** Panel con ventas válidas del día/semana/mes (conteo y total), pedidos por estado, cancelados/no entregados, **efectivo cobrado por cada domiciliario** y cierre de caja: el administrador registra cuánto efectivo recibió de cada domiciliario y el sistema muestra la diferencia.
- CA: una venta es válida solo si `status = ENTREGADO` **y** `payment_confirmed_at` no es nulo; los reportes usan exactamente esa definición; exportación CSV.

**RF-23 (M) Gestión de menú.** CRUD de categorías (orden arrastrable o con flechas) y productos (nombre, descripción, precio, foto, categoría, disponible, destacado, orden, grupos de opciones). Cambio rápido de precio y de disponibilidad desde la lista. Eliminar = desactivar (borrado lógico) para no romper pedidos antiguos (los pedidos guardan una **copia** del nombre y precio).
- CA: un cambio de menú se refleja en el sitio en ≤ 60 s (invalidación de caché, ver 9.5).

**RF-24 (M) Subida de fotos.** Subir imagen desde el celular o computador; el navegador la reduce y convierte a WebP/AVIF antes de subir (máx. 1600 px de lado largo, ≤ 400 KB); se guardan variantes (miniatura 400 px, normal 800 px, grande 1600 px) en R2.
- CA: se rechazan tipos no imagen y archivos > 10 MB antes de procesar; las imágenes del sitio usan `srcset`, `width/height` y `loading="lazy"` salvo la principal.

**RF-25 (M) Promociones y banners.** CRUD de banners (imagen, título, texto, enlace opcional a categoría/producto, fechas de inicio y fin, orden, activo).

**RF-26 (M) Videos.** Subir un video (MP4, ≤ 60 MB, se recomienda ≤ 30 s y vertical u horizontal) a R2 **o** pegar un enlace permitido (YouTube/Facebook; por CSP solo se admite abrir en nueva pestaña o usar la miniatura con enlace, no iframe). Un video destacado en inicio.
- CA: el reproductor usa `<video controls playsinline preload="metadata" poster>`; el archivo se sirve con soporte de `Range`.

**RF-27 (M) Reservas (panel).** Lista por fecha y estado; **Confirmar**, **Rechazar** (con motivo) y **Avisar por WhatsApp** (mensaje prellenado); marcar "asistió/no asistió" (S).

**RF-28 (M) Ajustes del negocio.** Nombre, número de WhatsApp que recibe pedidos y reservas, dirección, horarios por día (con cierres especiales/festivos), costo de domicilio (fijo, con opción de domicilio gratis desde cierto monto), pedido mínimo, minutos para resaltar pedidos sin confirmar, datos para transferencias (banco/Nequi/Daviplata, titular y número), si se permiten pedidos con el local cerrado, mostrar u ocultar productos agotados, enlaces a redes.
- CA: cambios guardados con validación; los datos de pago nunca viajan al cliente hasta que el pedido está confirmado.

**RF-29 (M) Usuarios.** Crear, editar, desactivar y restablecer contraseña de administradores y domiciliarios. Un administrador no puede desactivarse a sí mismo si es el único activo.

**RF-30 (S) Auditoría.** Vista de eventos (quién cambió qué y cuándo) filtrable.

**RF-31 (S) Imprimir/ver comanda.** Vista limpia de un pedido para imprimir (CSS de impresión; el botón de imprimir abre la vista y el usuario imprime con el navegador del dispositivo).

## 4.3 Domiciliario

**RF-40 (M) Mis entregas.** Ve solo pedidos asignados a él en estados `CONFIRMADO` y `EN_CAMINO`, más una lista "hechos hoy". Cada tarjeta: código, nombre, teléfono (enlace para llamar), dirección con enlace "Abrir en Maps", productos, nota, y **cuánto debe cobrar** (efectivo: total, con "paga con X, devolver Y"; transferencia: "no cobrar").
- CA: otro domiciliario no puede ver ni modificar el pedido (probar con una prueba de autorización); el teléfono del cliente deja de ser visible 24 h después de entregado.

**RF-41 (M) Acciones.** "Salí a entregar" (`CONFIRMADO → EN_CAMINO`), "Entregado y cobrado" (efectivo: `→ ENTREGADO` con pago confirmado), "Entregado" (transferencia: `→ ENTREGADO`, el pago lo verifica el administrador), "No entregado" con motivo (lista de motivos + texto).
- CA: botones grandes, usables con una mano; confirmación de dos pasos solo en "No entregado"; cada acción queda en `order_events`.

**RF-42 (M) Efectivo en mi poder.** Muestra el efectivo cobrado hoy para entregar en caja.

**RF-43 (S) PWA.** Instalable ("Agregar a pantalla de inicio"), abre directo en "Mis entregas", funciona con mala conexión (muestra últimos datos y encola acciones, avisando que están pendientes de sincronizar).

**RF-44 (O) Notificación de pedido asignado** (web push o enlace por WhatsApp/Telegram).

## 4.4 Transversales

**RF-50 (M) Estados y reglas de venta válida** (sección 8).
**RF-51 (M) Códigos de pedido** consecutivos y legibles (`#0001`), únicos, generados por secuencia en base de datos.
**RF-52 (M) Protección contra abuso:** Turnstile en pedido y reserva; límites de frecuencia (ver 15).
**RF-53 (M) Todos los importes en pesos enteros (COP), nunca flotantes.**
**RF-54 (M) Zona horaria `America/Bogota` para todo lo visible; se guarda en UTC.**
**RF-55 (S) Retención de datos:** anonimizar datos personales de pedidos con más de N meses (por defecto 12) conservando totales para reportes.

---

