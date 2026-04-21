---
name: instagram-carousel
description: Genera carruseles para Instagram con gráficos vectoriales SVG y contenido automatizado según tu nicho y marca
metadata:
  tags: instagram, carousel, svg, social-media, marketing, content
---

## Descripción

Esta skill genera carruseles completos para Instagram: contenido escrito + slides SVG vectoriales (sin imágenes AI, solo formas, colores, tipografía y geometría). Cada ejecución produce archivos SVG listos para exportar/convertir.

## Flujo de ejecución

Al invocarse `/instagram-carousel`, sigue este flujo **sin saltarte pasos**:

### PASO 1 — Detectar perfil

Lee el archivo `~/.claude/instagram-carousels/profile.json`.

- Si **NO existe** → ejecuta el **Onboarding** (lee `rules/onboarding.md`)
- Si **SÍ existe** → carga el perfil y ve al **Paso 2**

### PASO 2 — Solicitar tema del carrusel

Pregunta al usuario:
```
¿Sobre qué tema quieres el carrusel de hoy?
(Puedes dar un tema, una pregunta frecuente de tu audiencia, o escribir "sorpréndeme" para que yo elija)
```

Si el usuario escribe **"sorpréndeme"** o similar, propón un tema relevante basado en el nicho del perfil y confirma antes de continuar.

### PASO 3 — Generar contenido

Lee `rules/content.md` y genera el contenido completo del carrusel.

### PASO 4 — Generar slides SVG

Lee `rules/svg-design.md` y genera los archivos SVG para cada slide.

### PASO 5 — Guardar archivos

Lee `rules/output.md` y guarda todos los archivos SVG y el `contenido.json`.

### PASO 6 — Generar preview HTML y abrir en navegador

Lee `rules/preview.md` y genera el archivo `preview.html` en la misma carpeta del carrusel. Luego ejecuta el comando correspondiente al sistema operativo del usuario para abrirlo automáticamente en el navegador. Muestra el resumen final al usuario.

## Notas importantes

- **Nunca generes imágenes AI ni uses URLs de imágenes externas** dentro de los SVGs.
- Todo el diseño se construye con elementos vectoriales: `rect`, `circle`, `ellipse`, `polygon`, `path`, `line`, `text`, `g`.
- Mantén consistencia visual entre todos los slides del mismo carrusel.
- El perfil del usuario se guarda una sola vez. Si el usuario quiere actualizarlo, debe escribir `/instagram-carousel actualizar perfil`.
