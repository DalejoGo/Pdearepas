# 3. Roles y casos de uso

| Rol | Cómo entra | Qué puede hacer |
|---|---|---|
| **Cliente** | Sin cuenta | Ver menú, armar y enviar pedido, ver estado con su enlace, reservar mesa |
| **Administrador** (`admin`) | Usuario + contraseña, ruta `/admin` | Todo el panel; crear/desactivar usuarios (admins y domiciliarios); ver auditoría |
| **Domiciliario** (`driver`) | Usuario + contraseña, ruta `/domiciliario` | Solo ver y operar los pedidos que le asignaron |

Regla: **el menor privilegio**. Un domiciliario nunca ve totales de ventas, otros pedidos, ni datos de clientes que no sean de su pedido asignado.

---

