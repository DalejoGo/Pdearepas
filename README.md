# El Punto de la Arepa y Algo Más — sitio web, pedidos, domicilios y reservas

Paquete de arranque **autosuficiente** para que Claude Code construya el proyecto completo en una **máquina nueva**. No depende de ningún otro repositorio, carpeta, cuenta ni conversación anterior.

- **Cliente:** El Punto de la Arepa y Algo Más (restaurante de comidas rápidas, San Juan de Arama, Meta, Colombia).
- **Elabora:** AIM Desarrollo y Automatizaciones. Contacto: Alejandro.
- **Qué se construye:** tienda en línea estilo KFC/Frisby con menú, pedidos que llegan por WhatsApp con total y dirección, reservas, panel del administrador y vista del domiciliario. Una venta solo es válida cuando está entregada y pagada.

## Qué hay en esta carpeta

```
README.md                  ← este archivo: cómo arrancar
CLAUDE.md                  ← reglas permanentes (Claude Code lo lee solo al abrir la carpeta)
PLAN.md                    ← índice del plan y orden de lectura
docs/
  plan/                    ← el plan detallado, una sección por archivo (00 a 22)
    14-fases/              ← una ficha por fase (fase-00.md … fase-12.md)
  referencia/              ← demo interactiva aprobada y su LEEME
  ESTADO.md                ← avance por fase (Claude lo actualiza al cerrar cada una)
  PENDIENTES.md            ← datos y decisiones que faltan
  DECISIONES.md            ← registro de decisiones (DEC-NNN)
  COSTOS.md                ← límites de planes gratuitos (se llena en la Fase 0)
  DESPLIEGUE.md            ← lista de migración a las cuentas del restaurante
setup/
  PREREQUISITOS.md         ← qué instalar en la máquina nueva
  check-env.sh             ← verifica herramientas (no imprime secretos)
prompts/                   ← textos listos para pegar en Claude Code
content/seed.json          ← menú y ajustes de EJEMPLO (reemplazar con los reales)
assets/logo-360.jpg        ← logo (pedir el original en alta resolución)
.env.example               ← variables de entorno (sin valores)
.gitignore
```

## Cómo arrancar en la máquina nueva

1. **Copie esta carpeta completa** a la máquina nueva (USB, zip, repositorio privado, etc.). No hace falta nada más.
2. **Instale lo necesario** siguiendo [`setup/PREREQUISITOS.md`](setup/PREREQUISITOS.md) y verifíquelo:
   ```bash
   bash setup/check-env.sh
   ```
3. **Tenga a mano** (no hace falta todo desde el inicio; Claude Code lo pedirá por rondas):
   - Menú real con precios (fotos o lista), fotos de los productos, logo original.
   - Número de WhatsApp del restaurante, dirección, horarios, costo de domicilio.
   - Cuentas de GitHub, Cloudflare y Neon (puede crearlas en el momento, es gratis) y, más adelante, el dominio.
4. **Abra Claude Code dentro de esta carpeta:**
   ```bash
   cd punto-de-la-arepa
   claude
   ```
5. **Pegue el prompt inicial** de [`prompts/00-iniciar.md`](prompts/00-iniciar.md). Claude Code hará la Fase 0 (preguntas y acuerdos) y seguirá fase por fase.
6. **Para retomar otro día** (o en otra máquina): pegue [`prompts/01-continuar.md`](prompts/01-continuar.md). Claude Code lee `docs/ESTADO.md` y continúa donde quedó.

## Reglas que usted debe conocer

- **Nunca pegue llaves, tokens ni contraseñas en el chat.** Claude Code le dirá qué comando ejecutar para cargarlas usted mismo. Si pega una por error, revóquela y cree otra.
- **Cuentas temporales:** se construye y prueba en *staging* con las cuentas que usted indique. Producción se crea desde cero en las cuentas del restaurante, con secretos nuevos (ver `docs/DESPLIEGUE.md`).
- **Publicar en producción siempre pide su confirmación.** Staging, solo cuando usted lo autorice.
- **Los datos de ejemplo** (menú, precios, nombres) son ficticios y se reemplazan con los reales.

## Por dónde seguir leyendo

[`PLAN.md`](PLAN.md) → índice completo del plan.
