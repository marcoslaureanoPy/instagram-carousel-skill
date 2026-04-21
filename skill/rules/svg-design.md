# Sistema de Diseño SVG para Carruseles Instagram

## Especificaciones técnicas

- **Dimensiones:** 1080 × 1080 px (cuadrado Instagram)
- **ViewBox:** `0 0 1080 1080`
- **Fuentes:** System fonts embebidas vía `<style>` o Google Fonts via `@import`
- **Sin imágenes externas:** Prohibido usar `<image href>` con URLs externas
- **Elementos permitidos:** `rect`, `circle`, `ellipse`, `polygon`, `path`, `line`, `polyline`, `text`, `tspan`, `g`, `defs`, `clipPath`, `linearGradient`, `radialGradient`, `pattern`, `use`

## Sistema tipográfico

```xml
<defs>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&amp;display=swap');
    .font-main { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; }
    .weight-black { font-weight: 900; }
    .weight-bold { font-weight: 700; }
    .weight-semibold { font-weight: 600; }
    .weight-regular { font-weight: 400; }
  </style>
</defs>
```

### Escala tipográfica
| Uso | Tamaño | Peso |
|-----|--------|------|
| Número grande decorativo | 200-280px | 900 |
| Título principal | 72-96px | 700-900 |
| Subtítulo | 44-56px | 600-700 |
| Cuerpo / descripción | 32-40px | 400-600 |
| Etiqueta / handle | 28-34px | 400-600 |
| Número de slide | 24-28px | 700 |

## Plantillas de layout por estilo

---

### ESTILO A — Minimalista

**Slide Hook:**
```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1080" width="1080" height="1080">
  <defs>
    <style>@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&amp;display=swap');</style>
  </defs>
  <!-- Fondo -->
  <rect width="1080" height="1080" fill="{background}"/>
  <!-- Línea decorativa izquierda -->
  <rect x="80" y="200" width="6" height="680" fill="{primary}" rx="3"/>
  <!-- Bloque de color superior derecho -->
  <rect x="780" y="0" width="300" height="300" fill="{primary}" opacity="0.08"/>
  <!-- Punto decorativo -->
  <circle cx="920" cy="820" r="120" fill="{secondary}" opacity="0.12"/>
  <!-- Número de slide -->
  <text x="100" y="195" font-family="Inter, sans-serif" font-size="24" font-weight="700" fill="{primary}" opacity="0.5">01</text>
  <!-- Título -->
  <text x="120" y="430" font-family="Inter, sans-serif" font-size="88" font-weight="900" fill="{text_dark}" dominant-baseline="middle">
    <tspan x="120" dy="0">{LINE1}</tspan>
    <tspan x="120" dy="105">{LINE2}</tspan>
    <tspan x="120" dy="105">{LINE3}</tspan>
  </text>
  <!-- Subtexto -->
  <text x="120" y="720" font-family="Inter, sans-serif" font-size="36" font-weight="400" fill="{text_dark}" opacity="0.65">{SUBTEXT}</text>
  <!-- Marca inferior -->
  <text x="120" y="990" font-family="Inter, sans-serif" font-size="28" font-weight="600" fill="{primary}">{BRAND}</text>
  <line x1="120" y1="940" x2="960" y2="940" stroke="{primary}" stroke-width="1.5" opacity="0.2"/>
</svg>
```

---

### ESTILO B — Bold / Impactante

**Slide Hook:**
```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1080" width="1080" height="1080">
  <defs>
    <style>@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&amp;display=swap');</style>
  </defs>
  <!-- Fondo dividido diagonal -->
  <rect width="1080" height="1080" fill="{primary}"/>
  <polygon points="0,1080 0,400 1080,0 1080,1080" fill="{background}"/>
  <!-- Círculo decorativo -->
  <circle cx="860" cy="200" r="180" fill="{secondary}" opacity="0.3"/>
  <circle cx="860" cy="200" r="100" fill="{secondary}" opacity="0.4"/>
  <!-- Número grande decorativo -->
  <text x="60" y="520" font-family="Inter, sans-serif" font-size="320" font-weight="900" fill="{primary}" opacity="0.06">{NUM}</text>
  <!-- Título -->
  <text x="80" y="500" font-family="Inter, sans-serif" font-size="96" font-weight="900" fill="{text_light}" letter-spacing="-2">
    <tspan x="80" dy="0">{LINE1}</tspan>
    <tspan x="80" dy="110">{LINE2}</tspan>
  </text>
  <!-- Subtexto -->
  <text x="80" y="760" font-family="Inter, sans-serif" font-size="38" font-weight="400" fill="{text_dark}" opacity="0.8">{SUBTEXT}</text>
  <!-- Tag marca -->
  <rect x="80" y="920" width="220" height="56" fill="{primary}" rx="28"/>
  <text x="190" y="953" font-family="Inter, sans-serif" font-size="26" font-weight="700" fill="{text_light}" text-anchor="middle">{BRAND}</text>
</svg>
```

---

### ESTILO C — Elegante

**Slide de Contenido (tip/paso):**
```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1080" width="1080" height="1080">
  <defs>
    <style>@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&amp;display=swap');</style>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:{background};stop-opacity:1"/>
      <stop offset="100%" style="stop-color:{secondary};stop-opacity:0.15"/>
    </linearGradient>
  </defs>
  <!-- Fondo gradiente suave -->
  <rect width="1080" height="1080" fill="url(#bg)"/>
  <!-- Marco elegante -->
  <rect x="40" y="40" width="1000" height="1000" fill="none" stroke="{primary}" stroke-width="1" opacity="0.2" rx="4"/>
  <rect x="55" y="55" width="970" height="970" fill="none" stroke="{primary}" stroke-width="0.5" opacity="0.1" rx="2"/>
  <!-- Número grande decorativo (fondo) -->
  <text x="540" y="680" font-family="Inter, sans-serif" font-size="500" font-weight="900" fill="{primary}" opacity="0.04" text-anchor="middle">{NUM}</text>
  <!-- Ornamento superior -->
  <line x1="440" y1="140" x2="640" y2="140" stroke="{primary}" stroke-width="1" opacity="0.4"/>
  <circle cx="540" cy="140" r="5" fill="{primary}" opacity="0.5"/>
  <!-- Número de punto -->
  <text x="540" y="300" font-family="Inter, sans-serif" font-size="60" font-weight="900" fill="{primary}" opacity="0.3" text-anchor="middle">{NUM_LABEL}</text>
  <!-- Título centrado -->
  <text x="540" y="500" font-family="Inter, sans-serif" font-size="78" font-weight="700" fill="{text_dark}" text-anchor="middle">
    <tspan x="540" dy="0">{LINE1}</tspan>
    <tspan x="540" dy="92">{LINE2}</tspan>
  </text>
  <!-- Separador -->
  <line x1="440" y1="640" x2="640" y2="640" stroke="{primary}" stroke-width="2" opacity="0.3"/>
  <!-- Subtexto -->
  <text x="540" y="720" font-family="Inter, sans-serif" font-size="34" font-weight="400" fill="{text_dark}" text-anchor="middle" opacity="0.7">
    <tspan x="540" dy="0">{SUBTEXT1}</tspan>
    <tspan x="540" dy="45">{SUBTEXT2}</tspan>
  </text>
  <!-- Marca -->
  <text x="540" y="980" font-family="Inter, sans-serif" font-size="26" font-weight="600" fill="{primary}" text-anchor="middle" opacity="0.6">{BRAND}</text>
</svg>
```

---

### ESTILO D — Dinámico / Asimétrico

**Slide de Contenido:**
```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1080" width="1080" height="1080">
  <defs>
    <style>@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&amp;display=swap');</style>
    <clipPath id="clip1">
      <polygon points="0,0 700,0 900,1080 0,1080"/>
    </clipPath>
  </defs>
  <!-- Fondo base -->
  <rect width="1080" height="1080" fill="{background}"/>
  <!-- Panel izquierdo diagonal -->
  <polygon points="0,0 700,0 900,1080 0,1080" fill="{primary}"/>
  <!-- Líneas dinámicas -->
  <line x1="720" y1="0" x2="920" y2="1080" stroke="{secondary}" stroke-width="4" opacity="0.5"/>
  <line x1="750" y1="0" x2="950" y2="1080" stroke="{secondary}" stroke-width="2" opacity="0.25"/>
  <!-- Círculo decorativo -->
  <circle cx="950" cy="180" r="140" fill="{secondary}" opacity="0.15"/>
  <circle cx="950" cy="180" r="80" fill="{secondary}" opacity="0.2"/>
  <!-- Número -->
  <text x="80" y="820" font-family="Inter, sans-serif" font-size="360" font-weight="900" fill="{text_light}" opacity="0.08">{NUM}</text>
  <!-- Número visible -->
  <text x="80" y="250" font-family="Inter, sans-serif" font-size="40" font-weight="900" fill="{text_light}" opacity="0.7">{NUM_LABEL}</text>
  <!-- Título en panel izquierdo -->
  <text x="80" y="440" font-family="Inter, sans-serif" font-size="86" font-weight="900" fill="{text_light}">
    <tspan x="80" dy="0">{LINE1}</tspan>
    <tspan x="80" dy="100">{LINE2}</tspan>
  </text>
  <!-- Subtexto en panel derecho -->
  <text x="940" y="580" font-family="Inter, sans-serif" font-size="32" font-weight="400" fill="{text_dark}" text-anchor="end" opacity="0.8">
    <tspan x="1010" dy="0">{SUBTEXT1}</tspan>
    <tspan x="1010" dy="45">{SUBTEXT2}</tspan>
    <tspan x="1010" dy="45">{SUBTEXT3}</tspan>
  </text>
  <!-- Marca -->
  <text x="80" y="1020" font-family="Inter, sans-serif" font-size="28" font-weight="700" fill="{text_light}" opacity="0.7">{BRAND}</text>
</svg>
```

---

### ESTILO E — Corporativo / Grid

**Slide de Contenido:**
```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1080" width="1080" height="1080">
  <defs>
    <style>@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&amp;display=swap');</style>
    <pattern id="grid" x="0" y="0" width="60" height="60" patternUnits="userSpaceOnUse">
      <path d="M 60 0 L 0 0 0 60" fill="none" stroke="{primary}" stroke-width="0.5" opacity="0.08"/>
    </pattern>
  </defs>
  <!-- Fondo con grid sutil -->
  <rect width="1080" height="1080" fill="{background}"/>
  <rect width="1080" height="1080" fill="url(#grid)"/>
  <!-- Barra superior de marca -->
  <rect x="0" y="0" width="1080" height="16" fill="{primary}"/>
  <!-- Barra lateral izquierda -->
  <rect x="0" y="0" width="16" height="1080" fill="{primary}"/>
  <!-- Header con color de acento -->
  <rect x="16" y="16" width="1064" height="200" fill="{primary}"/>
  <!-- Título en header -->
  <text x="80" y="135" font-family="Inter, sans-serif" font-size="72" font-weight="900" fill="{text_light}">
    <tspan x="80" dy="0">{LINE1}</tspan>
  </text>
  <!-- Número de slide -->
  <rect x="940" y="60" width="80" height="80" fill="{secondary}" rx="8" opacity="0.4"/>
  <text x="980" y="107" font-family="Inter, sans-serif" font-size="36" font-weight="900" fill="{text_light}" text-anchor="middle">{NUM}</text>
  <!-- Área de contenido -->
  <text x="80" y="350" font-family="Inter, sans-serif" font-size="44" font-weight="700" fill="{primary}">{SUBTITLE}</text>
  <!-- Línea separadora -->
  <line x1="80" y1="380" x2="1000" y2="380" stroke="{primary}" stroke-width="2" opacity="0.15"/>
  <!-- Descripción -->
  <text x="80" y="450" font-family="Inter, sans-serif" font-size="34" font-weight="400" fill="{text_dark}" opacity="0.8">
    <tspan x="80" dy="0">{SUBTEXT1}</tspan>
    <tspan x="80" dy="50">{SUBTEXT2}</tspan>
    <tspan x="80" dy="50">{SUBTEXT3}</tspan>
  </text>
  <!-- Bloque de acento con nota clave -->
  <rect x="80" y="700" width="920" height="130" fill="{primary}" opacity="0.06" rx="8"/>
  <rect x="80" y="700" width="8" height="130" fill="{primary}" rx="4"/>
  <text x="110" y="770" font-family="Inter, sans-serif" font-size="32" font-weight="600" fill="{primary}">{KEY_POINT}</text>
  <!-- Footer marca -->
  <rect x="0" y="1064" width="1080" height="16" fill="{primary}"/>
  <text x="540" y="1050" font-family="Inter, sans-serif" font-size="26" font-weight="600" fill="{primary}" text-anchor="middle" opacity="0.6">{BRAND} · {HANDLE}</text>
</svg>
```

---

## Slide de CTA (aplica a todos los estilos)

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1080" width="1080" height="1080">
  <defs>
    <style>@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;900&amp;display=swap');</style>
    <radialGradient id="radial" cx="50%" cy="50%" r="70%">
      <stop offset="0%" style="stop-color:{primary};stop-opacity:1"/>
      <stop offset="100%" style="stop-color:{secondary};stop-opacity:1"/>
    </radialGradient>
  </defs>
  <!-- Fondo con gradiente radial de marca -->
  <rect width="1080" height="1080" fill="url(#radial)"/>
  <!-- Círculos decorativos concéntricos -->
  <circle cx="540" cy="540" r="500" fill="none" stroke="{text_light}" stroke-width="1" opacity="0.1"/>
  <circle cx="540" cy="540" r="420" fill="none" stroke="{text_light}" stroke-width="1" opacity="0.08"/>
  <circle cx="540" cy="540" r="340" fill="none" stroke="{text_light}" stroke-width="1" opacity="0.06"/>
  <!-- Puntos decorativos en esquinas -->
  <circle cx="120" cy="120" r="8" fill="{text_light}" opacity="0.3"/>
  <circle cx="960" cy="120" r="8" fill="{text_light}" opacity="0.3"/>
  <circle cx="120" cy="960" r="8" fill="{text_light}" opacity="0.3"/>
  <circle cx="960" cy="960" r="8" fill="{text_light}" opacity="0.3"/>
  <!-- Texto CTA principal -->
  <text x="540" y="380" font-family="Inter, sans-serif" font-size="88" font-weight="900" fill="{text_light}" text-anchor="middle">
    <tspan x="540" dy="0">{CTA_LINE1}</tspan>
    <tspan x="540" dy="100">{CTA_LINE2}</tspan>
  </text>
  <!-- Separador -->
  <line x1="340" y1="530" x2="740" y2="530" stroke="{text_light}" stroke-width="2" opacity="0.4"/>
  <!-- Instrucción de acción -->
  <text x="540" y="620" font-family="Inter, sans-serif" font-size="36" font-weight="400" fill="{text_light}" text-anchor="middle" opacity="0.85">{ACTION_TEXT}</text>
  <!-- Íconos de acción (guardar + compartir) — SVG paths -->
  <!-- Bookmark icon -->
  <g transform="translate(380, 700)" opacity="0.8">
    <path d="M0,0 L40,0 L40,56 L20,42 L0,56 Z" fill="none" stroke="{text_light}" stroke-width="3" stroke-linejoin="round"/>
  </g>
  <text x="432" y="734" font-family="Inter, sans-serif" font-size="26" font-weight="600" fill="{text_light}" opacity="0.8">Guarda</text>
  <!-- Separador vertical -->
  <line x1="580" y1="705" x2="580" y2="755" stroke="{text_light}" stroke-width="1.5" opacity="0.4"/>
  <!-- Share icon -->
  <g transform="translate(615, 700)" opacity="0.8">
    <circle cx="10" cy="10" r="8" fill="none" stroke="{text_light}" stroke-width="2.5"/>
    <circle cx="40" cy="28" r="8" fill="none" stroke="{text_light}" stroke-width="2.5"/>
    <circle cx="10" cy="46" r="8" fill="none" stroke="{text_light}" stroke-width="2.5"/>
    <line x1="17" y1="14" x2="33" y2="24" stroke="{text_light}" stroke-width="2.5"/>
    <line x1="17" y1="42" x2="33" y2="32" stroke="{text_light}" stroke-width="2.5"/>
  </g>
  <text x="668" y="734" font-family="Inter, sans-serif" font-size="26" font-weight="600" fill="{text_light}" opacity="0.8">Comparte</text>
  <!-- Handle y marca -->
  <rect x="340" y="840" width="400" height="66" fill="{text_light}" opacity="0.15" rx="33"/>
  <text x="540" y="880" font-family="Inter, sans-serif" font-size="32" font-weight="700" fill="{text_light}" text-anchor="middle">{HANDLE}</text>
  <!-- Nombre de marca -->
  <text x="540" y="980" font-family="Inter, sans-serif" font-size="28" font-weight="600" fill="{text_light}" text-anchor="middle" opacity="0.7">{BRAND}</text>
</svg>
```

---

## Reglas para sustituir variables en los SVGs

Cuando generes los SVGs, reemplaza estas variables con los valores reales:

| Variable | Valor |
|----------|-------|
| `{primary}` | `colors.primary` del perfil |
| `{secondary}` | `colors.secondary` del perfil |
| `{accent}` | `colors.accent` del perfil |
| `{text_dark}` | `colors.text_dark` del perfil |
| `{text_light}` | `colors.text_light` del perfil |
| `{background}` | `colors.background` del perfil |
| `{BRAND}` | `brand_name` del perfil |
| `{HANDLE}` | `handle` del perfil |
| `{LINE1}`, `{LINE2}`, `{LINE3}` | Líneas del título del slide |
| `{SUBTEXT}`, `{SUBTEXT1}`, etc. | Texto de descripción |
| `{NUM}` | Número decorativo grande (01, 02…) |
| `{NUM_LABEL}` | Etiqueta de número (01 / 07) |
| `{SUBTITLE}` | Subtítulo del slide |
| `{KEY_POINT}` | Punto clave destacado |
| `{CTA_LINE1}`, `{CTA_LINE2}` | Texto del call to action |
| `{ACTION_TEXT}` | Instrucción (Guarda este carrusel / etc.) |

## División de texto en líneas

Para títulos largos, divide en líneas de **máximo 14-18 caracteres** por línea según el tamaño de fuente. Ejemplo:

- "5 errores que cometes en redes" → LINE1: "5 errores que" / LINE2: "cometes en" / LINE3: "redes"

Ajusta el `dy` entre `tspan` según el tamaño de fuente elegido (≈ font-size × 1.2).

## Consistencia entre slides

- Usa **el mismo layout base** para todos los slides de contenido de un carrusel
- Solo el slide 1 (hook) y el último (CTA) pueden tener diseño diferente
- Los colores deben ser los del perfil sin excepción
- Mantén el mismo tamaño de tipografía para el mismo tipo de elemento en todos los slides
