# 0. Cómo debe trabajar Claude Code (reglas que mandan sobre todo lo demás)

## 0.1 Reglas de trabajo

1. **Planear antes de construir y trabajar por fases.** Cada fase tiene objetivo, pasos, entregables, criterios de aceptación y verificación. Una fase no se da por cerrada hasta que **todos** sus criterios pasan y `bash scripts/ci/all.sh` está en verde.
2. **Preguntar en estilo entrevista cuando falte información.** Preguntas con opciones (usar `AskUserQuestion`), una ronda a la vez, máximo 4 preguntas por ronda. Poner la opción recomendada primero. **Nunca suponer** datos del restaurante: precios, productos, números, cuentas bancarias, horarios, direcciones, testimonios. Si no se tienen, se dejan marcados como `EJEMPLO` y se anotan en la lista de pendientes (`docs/PENDIENTES.md`).
3. **Usar agentes en paralelo** cuando el trabajo se pueda repartir sin que se pisen los archivos (ver sección 17). Cada agente recibe un alcance de archivos explícito y no toca nada fuera de él.
4. **Usar librerías probadas** en vez de reinventar lógica (validación, fechas, teléfonos, hashing, etc.). Ver sección 6.
5. **Todo lo editable queda fuera del código:** precios, productos, textos, horarios, costo de domicilio, número de WhatsApp y datos de pago viven en la base de datos (editables desde el panel) o en archivos de configuración/semilla. Nunca incrustados en componentes.
6. **Sin secretos en el código ni en el chat.** Ver sección 13. Si Alejandro pega una llave en el chat, **no usarla**: pedirle que la revoque y que cree una nueva y la cargue él mismo siguiendo las instrucciones.
7. **Versiones exactas** en `package.json` (sin `^` ni `~`) y nada publicado hace menos de 14 días, salvo parche de seguridad (se registra en `docs/DECISIONES.md`).
8. **Decisiones** que cambien este plan o la arquitectura se escriben en `docs/DECISIONES.md` (formato DEC-NNN: contexto, decisión, alternativas, consecuencias) **antes** de aplicarse.
9. **Código e identificadores en inglés; textos visibles al usuario en español de Colombia** (tuteo/usted: usar "usted" en textos formales y trato cercano en el menú). Los textos van en un diccionario (`packages/i18n` o `apps/web/src/i18n/es.ts`), no sueltos en componentes.
10. **Conventional Commits.** Commits pequeños y atómicos. Antes de cada commit: `bash scripts/ci/all.sh` en verde.
11. **Medir, no suponer.** Todo requisito de rendimiento de la sección 5 se mide y se deja el número en `docs/RENDIMIENTO.md`.
12. **Nunca inventar datos del restaurante.** Los datos de ejemplo de la demo (productos, precios, nombres de clientes) son **ficticios** y se marcan `EJEMPLO` hasta que Alejandro entregue los reales.

## 0.2 Permisos y despliegue (confirmar en la Fase 0, pregunta Q-0.7)

Valores por defecto, que Alejandro puede cambiar:

| Acción | Por defecto |
|---|---|
| `git commit` y `git push` con CI en verde | **Permitido sin preguntar** |
| Migraciones en base de **staging** | Permitido sin preguntar, con CI en verde |
| Despliegue a **staging** (Cloudflare) | **Solo cuando Alejandro lo pida**, o al cerrar cada fase si lo autoriza en Q-0.7. Mostrar primero en `localhost` |
| Despliegue a **producción** | **Siempre pide confirmación explícita** |
| Crear cuentas, pagar, cobrar dinero, comprar dominios, manejar llaves | **Siempre es de Alejandro** |
| Migraciones en base de producción | Siempre pide confirmación |

## 0.3 Cuentas (confirmar en la Fase 0, pregunta Q-0.4)

- Mientras se construye, se usan las **cuentas personales y temporales que Alejandro indique** (GitHub, Cloudflare, Neon) **solo para staging**.
- **Nada de lo personal llega a producción.** Antes del lanzamiento todo se recrea en las cuentas del restaurante (o de AIM a nombre del restaurante) con **secretos nuevos**. Nunca copiar ni "transferir" valores de una cuenta a otra; se generan nuevos. La lista de migración vive en `docs/DESPLIEGUE.md`.
- Si `gh` no aparece en el `PATH`, localizarlo con `which gh` (en Linux con snap suele estar en `/snap/bin/gh`) o pedir que se instale (ver `setup/PREREQUISITOS.md`).

---

