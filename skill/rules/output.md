# Reglas de Output — Guardado y Entrega

## Estructura de carpetas

```
~/.claude/instagram-carousels/
├── profile.json                    ← perfil del usuario (onboarding)
└── carousels/
    └── YYYY-MM-DD_slug-del-tema/
        ├── slide-01-hook.svg
        ├── slide-02-problema.svg
        ├── slide-03-punto-1.svg
        ├── slide-04-punto-2.svg
        ├── slide-05-punto-3.svg
        ├── slide-06-punto-4.svg       ← si aplica
        ├── slide-07-resumen.svg       ← si aplica
        ├── slide-08-cta.svg
        └── contenido.json
```

## Nombre de la carpeta del carrusel

Formato: `YYYY-MM-DD_slug`

Donde `slug` es el tema del carrusel en minúsculas, sin acentos, espacios reemplazados por guiones. Máximo 40 caracteres.

Ejemplo: `2025-06-12_5-errores-en-instagram`

## Archivo `contenido.json`

Guarda el contenido textual de todos los slides en:

```json
{
  "tema": "Título del tema",
  "tipo": "tips|errores|tutorial|mitos|datos",
  "fecha": "ISO date",
  "slides": [
    {
      "num": 1,
      "tipo": "hook",
      "titulo": "Texto del título",
      "subtexto": "Texto secundario o null"
    },
    {
      "num": 2,
      "tipo": "problema",
      "titulo": "...",
      "subtexto": "..."
    },
    {
      "num": 3,
      "tipo": "punto",
      "numero_punto": "01",
      "titulo": "...",
      "subtexto": "..."
    }
  ],
  "caption_sugerido": "Caption completo para pegar en Instagram con hashtags"
}
```

## Caption sugerido para Instagram

Genera también un caption listo para copiar y pegar. Incluye:

1. **Gancho** (primera línea, que aparece antes del "ver más")
2. **Desarrollo** breve (2-3 párrafos cortos)
3. **CTA** (guarda, comenta, comparte)
4. **Hashtags** relevantes al nicho (15-20 hashtags)

Ejemplo de estructura:
```
¿Estás cometiendo estos errores en Instagram? 👇

[Contenido breve 2-3 líneas]

Guarda este post para no olvidarlo ✅
¿Cuál de estos cometes tú? Cuéntame en los comentarios 👇

---
#hashtag1 #hashtag2 #hashtag3 ...
```

## Mensaje final al usuario

Una vez guardados todos los archivos, muestra:

```
✅ ¡Carrusel generado con éxito!

📁 Ubicación: ~/.claude/instagram-carousels/carousels/[nombre-carpeta]/

📊 Slides generados:
  01 - Hook
  02 - Problema/Contexto
  03 - [Título punto 1]
  04 - [Título punto 2]
  05 - [Título punto 3]
  06 - [Título punto 4] (si aplica)
  07 - Resumen/Bonus (si aplica)
  08 - CTA

📋 Caption para Instagram: guardado en contenido.json

💡 Para convertir SVG a PNG puedes usar:
   • Inkscape (gratis): Archivo → Exportar PNG
   • En navegador: abre el .svg y haz captura (o imprime como PDF)
   • Online: svgtopng.com o cloudconvert.com

¿Quieres ajustar algún slide o generar otro carrusel?
```

## Comandos especiales reconocidos

| Comando | Acción |
|---------|--------|
| `/instagram-carousel` | Flujo normal (detecta perfil o hace onboarding) |
| `/instagram-carousel actualizar perfil` | Repite el onboarding y sobreescribe `profile.json` |
| `/instagram-carousel ver perfil` | Muestra el perfil actual en formato legible |
| `/instagram-carousel [tema]` | Salta la pregunta del tema y usa directamente el texto como tema |
