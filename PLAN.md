# PLAN — Sitio web, pedidos, domicilios y reservas para "El Punto de la Arepa y Algo Más"

> Plan completo para que **Claude Code** construya todo el proyecto, de principio a fin, en una máquina nueva. Este paquete es autosuficiente.
> Contacto: Alejandro (AIM Desarrollo y Automatizaciones). Plan aprobado en conversación el 2026-11-11.
> Las referencias del tipo "sección 8.3" o "ver 9.5" apuntan al archivo `docs/plan/NN-*.md` cuyo número coincide con la sección.

## Orden de lectura

1. [`README.md`](README.md) y [`CLAUDE.md`](CLAUDE.md).
2. Secciones **00 a 03** (reglas, resumen, alcance, roles) y la **demo** de [`docs/referencia/LEEME.md`](docs/referencia/LEEME.md).
3. Antes de cada fase, leer **solo** su ficha en [`docs/plan/14-fases/`](docs/plan/14-fases/LEEME.md) y las secciones que esa ficha cite.
4. Avance: [`docs/ESTADO.md`](docs/ESTADO.md). Faltantes: [`docs/PENDIENTES.md`](docs/PENDIENTES.md).

## Índice del plan

| N.º | Sección | Archivo |
|---|---|---|
| 00 | Cómo debe trabajar Claude Code (reglas, permisos, cuentas) | [00-reglas-de-trabajo.md](docs/plan/00-reglas-de-trabajo.md) |
| 01 | Resumen del proyecto | [01-resumen.md](docs/plan/01-resumen.md) |
| 02 | Alcance (dentro, opcional, fuera) | [02-alcance.md](docs/plan/02-alcance.md) |
| 03 | Roles y casos de uso | [03-roles.md](docs/plan/03-roles.md) |
| 04 | Requisitos funcionales (RF-01…RF-55) | [04-requisitos-funcionales.md](docs/plan/04-requisitos-funcionales.md) |
| 05 | Requisitos no funcionales (RNF-01…RNF-21) | [05-requisitos-no-funcionales.md](docs/plan/05-requisitos-no-funcionales.md) |
| 06 | Arquitectura y tecnologías | [06-arquitectura.md](docs/plan/06-arquitectura.md) |
| 07 | Modelo de datos | [07-modelo-de-datos.md](docs/plan/07-modelo-de-datos.md) |
| 08 | Reglas de negocio (estados, venta válida, caja) | [08-reglas-de-negocio.md](docs/plan/08-reglas-de-negocio.md) |
| 09 | API | [09-api.md](docs/plan/09-api.md) |
| 10 | Mensajes de WhatsApp | [10-mensajes-whatsapp.md](docs/plan/10-mensajes-whatsapp.md) |
| 11 | Diseño y experiencia | [11-diseno.md](docs/plan/11-diseno.md) |
| 12 | Entrevista: lo que Claude Code debe preguntar | [12-entrevista.md](docs/plan/12-entrevista.md) |
| 13 | Credenciales, llaves y secretos | [13-credenciales.md](docs/plan/13-credenciales.md) |
| 14 | Fases paso a paso (13 fases) | [14-fases/LEEME.md](docs/plan/14-fases/LEEME.md) |
| 15 | Seguridad (OWASP) | [15-seguridad.md](docs/plan/15-seguridad.md) |
| 16 | Pruebas y calidad | [16-pruebas.md](docs/plan/16-pruebas.md) |
| 17 | Agentes en paralelo | [17-agentes-en-paralelo.md](docs/plan/17-agentes-en-paralelo.md) |
| 18 | Escalabilidad y crecimiento | [18-escalabilidad.md](docs/plan/18-escalabilidad.md) |
| 19 | Operación y soporte | [19-operacion.md](docs/plan/19-operacion.md) |
| 20 | Riesgos y decisiones abiertas | [20-riesgos.md](docs/plan/20-riesgos.md) |
| 21 | Definición de terminado | [21-definicion-de-terminado.md](docs/plan/21-definicion-de-terminado.md) |
| 22 | Anexos (menú de ejemplo, commits, orden de arranque) | [22-anexos.md](docs/plan/22-anexos.md) |

## Fases

| Fase | Ficha | Resultado |
|---|---|---|
| 0 | [fase-00](docs/plan/14-fases/fase-00.md) | Descubrimiento, preguntas, cuentas, límites de planes |
| 1 | [fase-01](docs/plan/14-fases/fase-01.md) | Repositorio, monorepo, CI |
| 2 | [fase-02](docs/plan/14-fases/fase-02.md) | Base de datos, lógica de negocio, autenticación |
| 3 | [fase-03](docs/plan/14-fases/fase-03.md) | Sitio público, menú, SEO |
| 4 | [fase-04](docs/plan/14-fases/fase-04.md) | Carrito, pedido y WhatsApp, seguimiento |
| 5 | [fase-05](docs/plan/14-fases/fase-05.md) | Panel del administrador |
| 6 | [fase-06](docs/plan/14-fases/fase-06.md) | Vista del domiciliario (PWA) |
| 7 | [fase-07](docs/plan/14-fases/fase-07.md) | Reservas |
| 8 | [fase-08](docs/plan/14-fases/fase-08.md) | Reportes y cierre de caja |
| 9 | [fase-09](docs/plan/14-fases/fase-09.md) | Automatizaciones e IA (solo lo aprobado) |
| 10 | [fase-10](docs/plan/14-fases/fase-10.md) | Endurecimiento: seguridad, rendimiento, accesibilidad, carga |
| 11 | [fase-11](docs/plan/14-fases/fase-11.md) | Staging, piloto y capacitación |
| 12 | [fase-12](docs/plan/14-fases/fase-12.md) | Producción y entrega |
