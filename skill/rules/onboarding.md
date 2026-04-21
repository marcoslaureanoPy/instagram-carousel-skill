# Onboarding — Conociendo tu marca

Cuando el perfil no existe, ejecuta este onboarding **una sola vez**. Hazlo conversacional, no como un formulario frío.

## Mensaje de bienvenida

Muestra este mensaje primero:

```
¡Bienvenido a tu generador de carruseles de Instagram!

Antes de crear tu primer carrusel, necesito conocerte un poco para que el contenido y el diseño sean perfectos para tu marca.

Te haré unas preguntas rápidas — solo una a la vez, sin prisa.
```

## Preguntas del onboarding

Haz las preguntas **de una en una**, esperando la respuesta antes de pasar a la siguiente.

---

**Pregunta 1 — Nicho y negocio:**
```
¿Cuál es tu nicho o tipo de negocio?
Ejemplo: coach de vida, restaurante de comida italiana, tienda de ropa sostenible, freelance de diseño gráfico, clínica dental, etc.
```

---

**Pregunta 2 — Audiencia:**
```
¿A quién le hablas principalmente?
Describe tu cliente o seguidor ideal: edad aproximada, intereses, qué problema tienen que tú resuelves.
```

---

**Pregunta 3 — Tono de comunicación:**
```
¿Cómo hablas con tu audiencia?
Elige el que más se acerque (o describe el tuyo):
  A) Profesional y formal
  B) Cercano y amigable
  C) Inspirador y motivacional
  D) Educativo y didáctico
  E) Divertido y desenfadado
  F) Otro (descríbelo)
```

---

**Pregunta 4 — Nombre de marca:**
```
¿Cuál es el nombre de tu marca, negocio o tu nombre si eres personal brand?
```

---

**Pregunta 5 — Colores de marca:**
```
¿Tienes colores de marca definidos?
Si sí, dime los colores (nombres o códigos hex como #FF5733).
Si no, elige una paleta que te guste:
  A) Negro + dorado (lujo, elegancia)
  B) Azul marino + blanco (confianza, profesional)
  C) Verde + crema (natural, orgánico)
  D) Rosa + blanco (femenino, delicado)
  E) Naranja + gris oscuro (energía, moderno)
  F) Morado + plateado (creativo, premium)
  G) Rojo + negro (impacto, urgencia)
  H) Turquesa + arena (fresco, playero)
```

---

**Pregunta 6 — Estilo visual:**
```
¿Qué estilo visual prefieres para tus carruseles?
  A) Minimalista (mucho espacio, poco texto, líneas limpias)
  B) Bold/Impactante (colores saturados, tipografía grande, geométrico)
  C) Elegante (colores neutros, formas suaves, sofisticado)
  D) Dinámico (diagonales, capas, asimétrico)
  E) Corporativo (ordenado, grid claro, iconos simples)
```

---

**Pregunta 7 — Idioma y handle:**
```
¿En qué idioma son tus contenidos?
Y si tienes, ¿cuál es tu @usuario de Instagram? (aparecerá en el último slide)
```

---

**Pregunta 8 — Tipos de contenido:**
```
¿Qué tipo de contenido sueles o quieres publicar?
Puedes elegir varios:
  A) Tips y consejos prácticos
  B) Errores comunes y cómo evitarlos
  C) Pasos para lograr algo (tutoriales)
  D) Mitos vs Realidad
  E) Antes y después
  F) Preguntas frecuentes
  G) Datos curiosos o estadísticas
  H) Motivación e inspiración
```

---

## Confirmación del perfil

Una vez respondidas todas las preguntas, muestra un resumen:

```
¡Perfecto! Aquí está tu perfil de marca:

📌 Nicho: [respuesta]
👥 Audiencia: [respuesta]
🗣 Tono: [respuesta]
🏷 Marca: [respuesta]
🎨 Colores: [color primario] + [color secundario] + [color de texto]
✨ Estilo: [respuesta]
🌐 Idioma: [respuesta] | @[handle]
📋 Contenido favorito: [respuesta]

¿Todo correcto? (sí / no, quiero cambiar algo)
```

Si el usuario confirma, guarda el perfil y muestra:
```
¡Listo! Tu perfil está guardado. Ahora dime: ¿sobre qué tema quieres tu primer carrusel?
```

## Estructura del JSON a guardar

Guarda en `~/.claude/instagram-carousels/profile.json`:

```json
{
  "niche": "descripción del nicho",
  "audience": "descripción de la audiencia",
  "tone": "código de tono (A-F) o descripción",
  "brand_name": "nombre de la marca",
  "colors": {
    "primary": "#hexcode",
    "secondary": "#hexcode",
    "accent": "#hexcode",
    "text_dark": "#hexcode",
    "text_light": "#hexcode",
    "background": "#hexcode"
  },
  "style": "código de estilo (A-E)",
  "language": "español/inglés/etc",
  "handle": "@usuario",
  "content_types": ["A", "C", "F"],
  "created_at": "ISO date"
}
```

### Reglas para asignar colores del perfil

Cuando el usuario elige una paleta predefinida o describe sus colores, convierte siempre a 6 valores hex:

| Paleta | primary | secondary | accent | text_dark | text_light | background |
|--------|---------|-----------|--------|-----------|------------|------------|
| Negro+dorado | #1A1A1A | #C9A84C | #E8C96B | #1A1A1A | #FFFFFF | #F5F0E8 |
| Azul+blanco | #1B3A6B | #2C5F9E | #4A8FD4 | #1B3A6B | #FFFFFF | #F0F4FA |
| Verde+crema | #2D5A27 | #4A8C3F | #8FBF8A | #2D3A1A | #FFFFFF | #F5F0E0 |
| Rosa+blanco | #C4738A | #E8A0B4 | #F2C4D0 | #3A1A22 | #FFFFFF | #FDF5F7 |
| Naranja+gris | #E85D04 | #F48C06 | #FAA307 | #212121 | #FFFFFF | #F5F5F0 |
| Morado+plata | #5C2D91 | #8B5CF6 | #A78BFA | #1A0A2E | #FFFFFF | #F5F0FF |
| Rojo+negro | #CC0000 | #E63333 | #FF6666 | #1A1A1A | #FFFFFF | #FFF5F5 |
| Turquesa+arena | #0D9488 | #14B8A6 | #5EEAD4 | #0D2926 | #FFFFFF | #F5F0E8 |
