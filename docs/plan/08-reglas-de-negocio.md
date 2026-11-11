# 8. Reglas de negocio

## 8.1 Cálculo de totales (en `packages/domain`, función pura y probada)

```
línea = (precio_unitario + Σ delta_opciones) × cantidad
subtotal = Σ líneas
domicilio = (fulfillment = delivery) ? (free_delivery_from y subtotal ≥ free_delivery_from ? 0 : delivery_fee) : 0
total = subtotal + domicilio
```
Redondeo: solo enteros; los precios se guardan enteros. Se guardan **copias** (`*_snapshot`) para que cambios posteriores del menú no alteren pedidos pasados.

## 8.2 Estados del pedido y transiciones válidas

Estados: `SOLICITADO`, `CONFIRMADO`, `EN_CAMINO`, `ENTREGADO`, `CANCELADO`, `NO_ENTREGADO`.

| Desde → Hacia | Quién | Condiciones |
|---|---|---|
| (nuevo) → `SOLICITADO` | Cliente (sistema) | Validaciones de RF-05 |
| `SOLICITADO` → `CONFIRMADO` | Admin | Si es domicilio, exige `driver_id` activo |
| `SOLICITADO` / `CONFIRMADO` → `CANCELADO` | Admin | Motivo obligatorio |
| `CONFIRMADO` → `EN_CAMINO` | Domiciliario asignado (o Admin) | Solo domicilio |
| `EN_CAMINO` → `ENTREGADO` | Domiciliario asignado (o Admin con motivo) | Efectivo: marca `payment_confirmed_at` en el mismo paso |
| `EN_CAMINO` → `NO_ENTREGADO` | Domiciliario asignado (o Admin) | Motivo obligatorio |
| `NO_ENTREGADO` → `CONFIRMADO` | Admin | Reasignación; limpia datos de ruta |
| `CONFIRMADO` → `ENTREGADO` | Admin | Para "recoger en local": el admin entrega y cobra; motivo no requerido en pickup |

Cualquier otra transición se **rechaza con 409** y no cambia nada. Cada transición es **atómica** (condición `WHERE status = <estado esperado>`) para evitar carreras entre dos personas.

## 8.3 Venta válida

```
venta_valida = (status = 'ENTREGADO') AND (payment_confirmed_at IS NOT NULL)
```
- **Efectivo:** `payment_confirmed_at` se llena cuando el domiciliario marca "Entregado y cobrado" (o el admin en pickup).
- **Transferencia:** `payment_confirmed_at` se llena cuando el **administrador** marca "Verificar pago" (puede hacerlo antes o después de la entrega). El domiciliario nunca confirma transferencias.
- Cancelados y no entregados **no suman** y quedan visibles con su motivo.
- Todos los reportes usan esta definición exacta, implementada **una sola vez** (vista SQL `valid_sales` o función en `domain`) y reutilizada.

## 8.4 Cierre de caja

Para cada domiciliario y día: `esperado = Σ total de pedidos en efectivo ENTREGADO ese día por él`; el administrador registra `recibido`; `diferencia = recibido − esperado`. Se guarda en `cash_settlements`; no se edita, se corrige con un nuevo registro y nota.

## 8.5 Horarios y "abierto/cerrado"

Se calcula en el servidor con `opening_hours` + `special_days` en `America/Bogota`. Horarios que cruzan medianoche se soportan (ej. 18:00–01:00).

## 8.6 Códigos y tokens

`orders.code` viene de una secuencia Postgres (`order_code_seq`), se muestra con ceros a la izquierda. El token público es aleatorio de 32 bytes (`crypto.getRandomValues`), se entrega una sola vez en la URL de seguimiento y **solo se guarda su hash**.

---

