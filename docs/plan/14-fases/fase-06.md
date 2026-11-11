# Fase 6 — Domiciliario

> Contexto: `../00-reglas-de-trabajo.md` aplica siempre. Al cerrar la fase, actualizar `docs/ESTADO.md`.

**Objetivo:** el domiciliario trabaja solo desde su celular.
1. `/domiciliario` (PWA): manifiesto, íconos, *service worker* mínimo (caché de la interfaz y últimos datos), instalación guiada.
2. Rutas `/api/driver/*` con filtro estricto por `driver_id` de la sesión.
3. Pantalla "Mis entregas" y "Hechos hoy" y "Efectivo en mi poder" (RF-40…43), cola de acciones sin conexión con indicador de "pendiente de sincronizar".
4. Pruebas: autorización (no ve pedidos ajenos), transiciones válidas/ inválidas, ocultamiento de teléfono 24 h después, E2E del flujo completo (cliente → admin confirma/asigna → domiciliario entrega → venta válida).
**Aceptación:** RF-40…43; el E2E completo en verde; con el celular en modo avión las acciones se encolan y se sincronizan al volver la red sin duplicarse (idempotencia por acción).

