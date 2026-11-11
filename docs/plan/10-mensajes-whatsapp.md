# 10. Contratos de mensajes de WhatsApp

Se construyen **solo en el servidor** (`packages/domain/messages.ts`) y se prueban con pruebas de *snapshot*. WhatsApp usa `*negrita*`. El enlace es `https://wa.me/<E164 sin +>?text=<encodeURIComponent(mensaje)>`; límite práctico de longitud ~ 1.500 caracteres (si se excede, resumir opciones).

## 10.1 Pedido (cliente → restaurante)

```
*Nuevo pedido #0042 - El Punto de la Arepa y Algo Más*

*Cliente:* Laura Pérez
*Teléfono:* 300 123 4567
*Entrega:* Domicilio
*Dirección:* Cra 5 # 8-20, barrio Centro (frente a la droguería)

*Productos:*
- 2 x Arepa mixta ($32.000)
   + queso extra
- 1 x Limonada ($5.000)

Subtotal: $37.000
Domicilio: $3.000
*Total a pagar: $40.000*

*Forma de pago:* Efectivo al entregar (paga con $50.000)
*Nota:* Sin cebolla
Seguimiento: https://<dominio>/pedido/<token>
```

Para "recoger en el local" se reemplaza *Dirección* por *Recoge en:* `<dirección del local>` y no hay línea de domicilio.

## 10.2 Reserva

```
*Solicitud de reserva - El Punto de la Arepa y Algo Más*

*Nombre:* Carlos Ruiz
*Teléfono:* 320 555 0103
*Fecha:* sábado, 21 de noviembre
*Hora:* 19:30
*Personas:* 4
*Nota:* Cumpleaños
```

## 10.3 Mensajes del administrador al cliente (plantillas editables en Ajustes)

Confirmado, en camino, datos para transferir, cancelado, reserva confirmada/rechazada. Texto con variables `{nombre}`, `{codigo}`, `{total}`, etc., validadas contra una lista permitida.

---

