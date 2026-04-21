# Instagram Carousel Skill — Claude Code

> Genera carruseles completos para Instagram: contenido escrito + slides SVG vectoriales + preview interactivo de Instagram. Sin imágenes AI — solo formas, colores, tipografía y geometría vectorial.

Desarrollado por [pyneuraLLC](https://github.com/pyneuraLLC)

---

## ¿Qué hace?

1. **Onboarding** — La primera vez te pregunta sobre tu nicho, audiencia, tono, marca, colores y estilo visual. Se guarda y no vuelve a preguntar.
2. **Contenido** — Genera el copy de cada slide adaptado a tu tono y audiencia.
3. **Slides SVG** — Crea archivos SVG 1080×1080px con diseño vectorial profesional (5 estilos disponibles).
4. **Preview HTML** — Genera un simulador de Instagram feed interactivo que se abre en el navegador, con el carrusel navegable, caption, hashtags y todos los elementos visuales de la app.

## Requisitos

- [Claude Code](https://claude.ai/code) (CLI o app de escritorio)

## Instalación

### Mac / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/pyneuraLLC/instagram-carousel-skill/main/install.sh | bash
```

O manualmente:

```bash
git clone https://github.com/pyneuraLLC/instagram-carousel-skill.git
cd instagram-carousel-skill
bash install.sh
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/pyneuraLLC/instagram-carousel-skill/main/install.ps1 | iex
```

O manualmente:

```powershell
git clone https://github.com/pyneuraLLC/instagram-carousel-skill.git
cd instagram-carousel-skill
.\install.ps1
```

### Instalación manual (cualquier OS)

Copia la carpeta `skill/` a `~/.claude/skills/instagram-carousel/`:

```
~/.claude/skills/instagram-carousel/
├── SKILL.md
└── rules/
    ├── onboarding.md
    ├── content.md
    ├── svg-design.md
    ├── output.md
    └── preview.md
```

Reinicia Claude Code.

## Uso

```
/instagram-carousel
```

La primera vez inicia el onboarding. Después de eso, cada ejecución genera un carrusel completo.

### Comandos

| Comando | Acción |
|---------|--------|
| `/instagram-carousel` | Flujo normal |
| `/instagram-carousel [tema]` | Va directo al tema |
| `/instagram-carousel actualizar perfil` | Rehace el onboarding |
| `/instagram-carousel ver perfil` | Muestra tu perfil guardado |

## Output

Cada carrusel se guarda en:

```
~/.claude/instagram-carousels/carousels/YYYY-MM-DD_slug-del-tema/
├── slide-01-hook.svg
├── slide-02-problema.svg
├── slide-03-punto-1.svg
├── ...
├── slide-0N-cta.svg
├── contenido.json        ← caption + hashtags + estructura
└── preview.html          ← simulador de Instagram (se abre automáticamente)
```

## Estilos de diseño disponibles

| Estilo | Descripción |
|--------|-------------|
| **Minimalista** | Espacio en blanco, línea vertical de color, tipografía limpia |
| **Bold/Impactante** | Fondo diagonal, colores saturados, tipografía 96px |
| **Elegante** | Marco doble, gradiente suave, todo centrado, ornamentos |
| **Dinámico** | Panel diagonal, líneas paralelas, layout asimétrico |
| **Corporativo** | Grid sutil, barras de marca, header sólido, bloques de datos |

## Usar en Claude desktop app (sin Claude Code)

Si prefieres usar el generador en la app de escritorio de Claude (claude.ai), usa el prompt compilado incluido en [`prompt/claude-desktop-prompt.md`](prompt/claude-desktop-prompt.md).

1. Abre Claude desktop app
2. Crea un **Project** nuevo
3. En **Project instructions** pega el contenido del archivo
4. Escribe `inicio` para comenzar

En este modo los SVGs se generan como artefactos renderizados directamente en el chat.

## Preview

El simulador de Instagram genera:

- Marco de iPhone con dark mode
- Stories bar, post header con tu avatar de marca
- Carrusel con navegación (flechas, dots, drag, swipe, teclado)
- Like, bookmark, compartir interactivos
- Caption expandible con hashtags en azul
- Navbar inferior de Instagram

## Licencia

MIT — úsala, modifícala y compártela libremente.
