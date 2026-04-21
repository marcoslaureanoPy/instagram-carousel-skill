# Preview HTML — Simulador de Instagram

## Qué genera esta regla

Después de guardar los SVGs, genera un archivo `preview.html` dentro de la misma carpeta del carrusel. Al abrirlo en el navegador muestra una simulación realista de cómo se vería el post en Instagram (feed móvil), con el carrusel navegable, la descripción, hashtags y todos los elementos visuales de la app.

## Cómo abrirlo automáticamente

Después de guardar el HTML, ejecuta este comando para abrirlo en el navegador por defecto:

```bash
# Windows
start ~/.claude/instagram-carousels/carousels/[nombre-carpeta]/preview.html

# Mac
open ~/.claude/instagram-carousels/carousels/[nombre-carpeta]/preview.html

# Linux
xdg-open ~/.claude/instagram-carousels/carousels/[nombre-carpeta]/preview.html
```

Si el comando falla, indica al usuario la ruta exacta para que la abra manualmente.

## Plantilla HTML completa

Genera exactamente este HTML, sustituyendo las variables indicadas. Los SVGs se referencian con rutas relativas (están en la misma carpeta).

```html
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Preview — {CAROUSEL_TOPIC} · {BRAND}</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    background: #0a0a0a;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    padding: 40px 16px 80px;
  }

  /* Label de preview */
  .preview-label {
    color: #555;
    font-size: 11px;
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-bottom: 24px;
    font-weight: 600;
  }

  /* Contenedor del teléfono */
  .phone-frame {
    width: 393px;
    background: #000;
    border-radius: 48px;
    padding: 12px;
    box-shadow:
      0 0 0 2px #2a2a2a,
      0 0 0 4px #1a1a1a,
      0 40px 80px rgba(0,0,0,0.8);
    position: relative;
  }

  .phone-screen {
    background: #000;
    border-radius: 38px;
    overflow: hidden;
    position: relative;
  }

  /* Notch/Dynamic island */
  .dynamic-island {
    width: 120px;
    height: 34px;
    background: #000;
    border-radius: 20px;
    margin: 12px auto 8px;
    border: 1.5px solid #1a1a1a;
    position: relative;
    z-index: 10;
  }

  /* Instagram App */
  .instagram-app {
    background: #000;
    min-height: 800px;
  }

  /* Top bar de Instagram */
  .ig-topbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 8px 16px 10px;
    border-bottom: 0.5px solid #262626;
  }

  .ig-logo {
    font-size: 22px;
    font-weight: 700;
    color: #fff;
    letter-spacing: -0.5px;
    font-family: 'Billabong', 'Dancing Script', cursive, sans-serif;
  }

  .ig-topbar-actions {
    display: flex;
    gap: 18px;
    align-items: center;
  }

  .ig-icon {
    width: 24px;
    height: 24px;
    fill: none;
    stroke: #fff;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
    cursor: pointer;
  }

  /* Stories bar */
  .stories-bar {
    display: flex;
    gap: 12px;
    padding: 12px 14px;
    overflow: hidden;
    border-bottom: 0.5px solid #1a1a1a;
  }

  .story-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 4px;
    flex-shrink: 0;
  }

  .story-ring {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    padding: 2px;
    background: linear-gradient(45deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888);
  }

  .story-ring.seen {
    background: #333;
  }

  .story-avatar {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: {STORY_COLOR};
    border: 2.5px solid #000;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    font-weight: 700;
    color: #fff;
    letter-spacing: -1px;
  }

  .story-name {
    font-size: 10px;
    color: #aaa;
    text-align: center;
    max-width: 56px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .story-name.mine { color: #fff; }

  /* POST */
  .ig-post {
    border-bottom: 0.5px solid #1a1a1a;
    padding-bottom: 4px;
  }

  /* Post header */
  .post-header {
    display: flex;
    align-items: center;
    padding: 10px 14px;
    gap: 10px;
  }

  .post-avatar-ring {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    padding: 2px;
    background: linear-gradient(45deg, #f09433, #e6683c, #dc2743, #cc2366, #bc1888);
    flex-shrink: 0;
  }

  .post-avatar {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: {PRIMARY};
    border: 2px solid #000;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 14px;
    font-weight: 900;
    color: {TEXT_LIGHT};
  }

  .post-meta {
    flex: 1;
  }

  .post-username {
    font-size: 13px;
    font-weight: 600;
    color: #fff;
    line-height: 1.2;
  }

  .post-location {
    font-size: 11px;
    color: #aaa;
    line-height: 1.2;
  }

  .post-more {
    color: #fff;
    font-size: 18px;
    line-height: 1;
    cursor: pointer;
    padding: 4px;
  }

  /* Carousel */
  .carousel-container {
    position: relative;
    width: 100%;
    aspect-ratio: 1;
    background: #111;
    overflow: hidden;
  }

  .carousel-track {
    display: flex;
    transition: transform 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    height: 100%;
    will-change: transform;
  }

  .carousel-slide {
    flex-shrink: 0;
    width: 100%;
    height: 100%;
  }

  .carousel-slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    pointer-events: none;
  }

  /* Flechas de navegación */
  .carousel-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 32px;
    height: 32px;
    background: rgba(0,0,0,0.6);
    border-radius: 50%;
    border: none;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 5;
    backdrop-filter: blur(4px);
    transition: background 0.2s;
  }

  .carousel-btn:hover { background: rgba(0,0,0,0.8); }
  .carousel-btn.prev { left: 10px; }
  .carousel-btn.next { right: 10px; }
  .carousel-btn svg { stroke: #fff; width: 16px; height: 16px; }
  .carousel-btn.hidden { opacity: 0; pointer-events: none; }

  /* Contador de slides */
  .slide-counter {
    position: absolute;
    top: 12px;
    right: 12px;
    background: rgba(0,0,0,0.65);
    color: #fff;
    font-size: 12px;
    font-weight: 600;
    padding: 4px 10px;
    border-radius: 20px;
    z-index: 5;
    backdrop-filter: blur(4px);
  }

  /* Dots indicador */
  .carousel-dots {
    display: flex;
    justify-content: center;
    gap: 4px;
    padding: 8px 0 4px;
  }

  .dot {
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: #444;
    transition: all 0.2s;
    cursor: pointer;
  }

  .dot.active {
    background: #3897f0;
    width: 18px;
    border-radius: 3px;
  }

  /* Barra de acciones */
  .post-actions {
    display: flex;
    align-items: center;
    padding: 8px 14px 4px;
    gap: 16px;
  }

  .action-btn {
    background: none;
    border: none;
    cursor: pointer;
    padding: 2px;
    display: flex;
    align-items: center;
    gap: 5px;
    transition: transform 0.1s;
  }

  .action-btn:active { transform: scale(0.85); }

  .action-btn svg {
    width: 26px;
    height: 26px;
    stroke: #fff;
    fill: none;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
  }

  .action-btn.liked svg { stroke: #ed4956; fill: #ed4956; }

  .bookmark-btn {
    margin-left: auto;
  }

  .bookmark-btn svg {
    width: 26px;
    height: 26px;
    stroke: #fff;
    fill: none;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
  }

  /* Likes */
  .post-likes {
    padding: 4px 14px;
    font-size: 13px;
    font-weight: 600;
    color: #fff;
  }

  /* Caption */
  .post-caption {
    padding: 4px 14px 8px;
    font-size: 13px;
    color: #fff;
    line-height: 1.5;
  }

  .caption-username {
    font-weight: 700;
    margin-right: 5px;
    color: #fff;
  }

  .caption-text {
    color: #e0e0e0;
  }

  .caption-more {
    color: #aaa;
    cursor: pointer;
    font-weight: 400;
  }

  .caption-hashtags {
    color: #3897f0;
    font-size: 13px;
    padding: 4px 14px 6px;
    line-height: 1.8;
  }

  /* Comments */
  .post-comments-link {
    padding: 2px 14px 6px;
    font-size: 13px;
    color: #888;
    cursor: pointer;
  }

  /* Input comentario */
  .post-comment-input {
    display: flex;
    align-items: center;
    padding: 8px 14px;
    gap: 10px;
    border-top: 0.5px solid #1a1a1a;
  }

  .comment-avatar {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: #333;
    flex-shrink: 0;
  }

  .comment-placeholder {
    flex: 1;
    font-size: 13px;
    color: #555;
  }

  .comment-emoji {
    font-size: 18px;
    cursor: pointer;
  }

  /* Timestamp */
  .post-timestamp {
    padding: 2px 14px 10px;
    font-size: 10px;
    color: #555;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  /* Barra de navegación inferior */
  .ig-navbar {
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 12px 8px 20px;
    border-top: 0.5px solid #262626;
    background: #000;
  }

  .nav-btn {
    background: none;
    border: none;
    cursor: pointer;
    padding: 4px;
  }

  .nav-btn svg {
    width: 26px;
    height: 26px;
    stroke: #fff;
    fill: none;
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
  }

  .nav-btn.active svg { fill: #fff; }

  .nav-profile-pic {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: {PRIMARY};
    border: 2px solid #fff;
  }

  /* Indicador de home bar del iPhone */
  .home-indicator {
    width: 134px;
    height: 5px;
    background: #333;
    border-radius: 3px;
    margin: 8px auto 4px;
  }

  /* Nota de preview */
  .preview-note {
    margin-top: 24px;
    color: #444;
    font-size: 12px;
    text-align: center;
    max-width: 393px;
    line-height: 1.7;
  }

  .preview-note strong { color: #666; }

  /* Touch/swipe support visual */
  .swipe-hint {
    position: absolute;
    bottom: 60px;
    left: 0;
    right: 0;
    text-align: center;
    font-size: 11px;
    color: rgba(255,255,255,0.4);
    pointer-events: none;
    animation: fadeHint 3s ease-out forwards;
  }

  @keyframes fadeHint {
    0% { opacity: 1; }
    60% { opacity: 1; }
    100% { opacity: 0; }
  }
</style>
</head>
<body>

<div class="preview-label">Vista previa · Instagram Feed</div>

<div class="phone-frame">
  <div class="phone-screen">
    <div class="dynamic-island"></div>

    <div class="instagram-app">

      <!-- Top bar -->
      <div class="ig-topbar">
        <div class="ig-logo">Instagram</div>
        <div class="ig-topbar-actions">
          <!-- Heart icon -->
          <svg class="ig-icon" viewBox="0 0 24 24">
            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
          </svg>
          <!-- Messenger icon -->
          <svg class="ig-icon" viewBox="0 0 24 24">
            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
          </svg>
        </div>
      </div>

      <!-- Stories bar -->
      <div class="stories-bar">
        <div class="story-item">
          <div class="story-ring">
            <div class="story-avatar" style="background:{PRIMARY}; font-size:11px">{BRAND_INITIALS}</div>
          </div>
          <span class="story-name mine">Tu historia</span>
        </div>
        <!-- Stories genéricas decorativas -->
        <div class="story-item">
          <div class="story-ring seen"><div class="story-avatar" style="background:#4a4a6a">MK</div></div>
          <span class="story-name">mktg.co</span>
        </div>
        <div class="story-item">
          <div class="story-ring"><div class="story-avatar" style="background:#6a3a3a">FS</div></div>
          <span class="story-name">fitstore</span>
        </div>
        <div class="story-item">
          <div class="story-ring seen"><div class="story-avatar" style="background:#3a5a4a">EC</div></div>
          <span class="story-name">ecoclub</span>
        </div>
        <div class="story-item">
          <div class="story-ring"><div class="story-avatar" style="background:#5a4a2a">DG</div></div>
          <span class="story-name">designr</span>
        </div>
      </div>

      <!-- POST -->
      <div class="ig-post">

        <!-- Post header -->
        <div class="post-header">
          <div class="post-avatar-ring">
            <div class="post-avatar">{BRAND_INITIALS}</div>
          </div>
          <div class="post-meta">
            <div class="post-username">{HANDLE_CLEAN}</div>
            <div class="post-location">{NICHE_LABEL}</div>
          </div>
          <div class="post-more">···</div>
        </div>

        <!-- Carousel -->
        <div class="carousel-container" id="carousel">
          <div class="slide-counter"><span id="current-slide">1</span> / {TOTAL_SLIDES}</div>

          <button class="carousel-btn prev hidden" id="btn-prev" onclick="changeSlide(-1)" aria-label="Anterior">
            <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg>
          </button>

          <div class="carousel-track" id="track">
            {SLIDES_HTML}
          </div>

          <button class="carousel-btn next" id="btn-next" onclick="changeSlide(1)" aria-label="Siguiente">
            <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg>
          </button>

          <div class="swipe-hint">← desliza →</div>
        </div>

        <!-- Dots -->
        <div class="carousel-dots" id="dots">
          {DOTS_HTML}
        </div>

        <!-- Acciones -->
        <div class="post-actions">
          <button class="action-btn" id="like-btn" onclick="toggleLike()" title="Me gusta">
            <svg viewBox="0 0 24 24">
              <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
            </svg>
          </button>
          <button class="action-btn" title="Comentar">
            <svg viewBox="0 0 24 24">
              <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
            </svg>
          </button>
          <button class="action-btn" title="Compartir">
            <svg viewBox="0 0 24 24">
              <line x1="22" y1="2" x2="11" y2="13"/>
              <polygon points="22 2 15 22 11 13 2 9 22 2"/>
            </svg>
          </button>
          <button class="action-btn bookmark-btn" id="bookmark-btn" onclick="toggleBookmark()" title="Guardar">
            <svg viewBox="0 0 24 24">
              <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"/>
            </svg>
          </button>
        </div>

        <!-- Likes -->
        <div class="post-likes" id="likes-count">{LIKES_COUNT} Me gusta</div>

        <!-- Caption -->
        <div class="post-caption">
          <span class="caption-username">{HANDLE_CLEAN}</span>
          <span class="caption-text" id="caption-text">{CAPTION_SHORT}</span>
          <span class="caption-more" id="caption-toggle" onclick="toggleCaption()"> más</span>
        </div>

        <!-- Hashtags -->
        <div class="caption-hashtags" id="hashtags" style="display:none">{HASHTAGS_HTML}</div>

        <!-- Comentarios -->
        <div class="post-comments-link">Ver los {COMMENTS_COUNT} comentarios</div>

        <!-- Input comentario -->
        <div class="post-comment-input">
          <div class="comment-avatar"></div>
          <span class="comment-placeholder">Añade un comentario...</span>
          <span class="comment-emoji">😊</span>
        </div>

        <!-- Timestamp -->
        <div class="post-timestamp">{TIME_AGO}</div>

      </div><!-- /ig-post -->

    </div><!-- /instagram-app -->

    <!-- Navbar -->
    <div class="ig-navbar">
      <!-- Home -->
      <button class="nav-btn active">
        <svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
      </button>
      <!-- Search -->
      <button class="nav-btn">
        <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      </button>
      <!-- Reels -->
      <button class="nav-btn">
        <svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="2.18" ry="2.18"/><line x1="7" y1="2" x2="7" y2="22"/><line x1="17" y1="2" x2="17" y2="22"/><line x1="2" y1="12" x2="22" y2="12"/><line x1="2" y1="7" x2="7" y2="7"/><line x1="2" y1="17" x2="7" y2="17"/><line x1="17" y1="17" x2="22" y2="17"/><line x1="17" y1="7" x2="22" y2="7"/></svg>
      </button>
      <!-- Shop -->
      <button class="nav-btn">
        <svg viewBox="0 0 24 24"><path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 0 1-8 0"/></svg>
      </button>
      <!-- Profile -->
      <button class="nav-btn">
        <div class="nav-profile-pic"></div>
      </button>
    </div>

    <div class="home-indicator"></div>

  </div><!-- /phone-screen -->
</div><!-- /phone-frame -->

<div class="preview-note">
  <strong>Vista previa generada por Claude Code</strong><br>
  Carrusel: {CAROUSEL_TOPIC}<br>
  Slides: {TOTAL_SLIDES} · Marca: {BRAND} · {HANDLE}<br><br>
  Los archivos SVG están en la misma carpeta.<br>
  Para publicar, convierte los SVG a PNG (1080×1080px).
</div>

<script>
  const totalSlides = {TOTAL_SLIDES};
  let current = 0;
  let liked = false;
  let bookmarked = false;
  let captionExpanded = false;
  let likesBase = {LIKES_BASE};

  const track = document.getElementById('track');
  const dots = document.querySelectorAll('.dot');
  const currentSlideEl = document.getElementById('current-slide');
  const btnPrev = document.getElementById('btn-prev');
  const btnNext = document.getElementById('btn-next');

  function updateCarousel() {
    track.style.transform = `translateX(-${current * 100}%)`;
    dots.forEach((d, i) => d.classList.toggle('active', i === current));
    currentSlideEl.textContent = current + 1;
    btnPrev.classList.toggle('hidden', current === 0);
    btnNext.classList.toggle('hidden', current === totalSlides - 1);
  }

  function changeSlide(dir) {
    current = Math.max(0, Math.min(totalSlides - 1, current + dir));
    updateCarousel();
  }

  // Click en dots
  document.getElementById('dots').addEventListener('click', e => {
    const dot = e.target.closest('.dot');
    if (dot) {
      current = parseInt(dot.dataset.index);
      updateCarousel();
    }
  });

  // Swipe táctil
  let startX = 0;
  const carousel = document.getElementById('carousel');
  carousel.addEventListener('touchstart', e => { startX = e.touches[0].clientX; }, { passive: true });
  carousel.addEventListener('touchend', e => {
    const diff = startX - e.changedTouches[0].clientX;
    if (Math.abs(diff) > 40) changeSlide(diff > 0 ? 1 : -1);
  });

  // Drag con mouse
  let mouseStartX = 0;
  let isDragging = false;
  carousel.addEventListener('mousedown', e => { mouseStartX = e.clientX; isDragging = true; e.preventDefault(); });
  carousel.addEventListener('mouseup', e => {
    if (!isDragging) return;
    isDragging = false;
    const diff = mouseStartX - e.clientX;
    if (Math.abs(diff) > 40) changeSlide(diff > 0 ? 1 : -1);
  });
  carousel.addEventListener('mouseleave', () => { isDragging = false; });

  // Teclado
  document.addEventListener('keydown', e => {
    if (e.key === 'ArrowRight') changeSlide(1);
    if (e.key === 'ArrowLeft') changeSlide(-1);
  });

  // Like
  function toggleLike() {
    liked = !liked;
    const btn = document.getElementById('like-btn');
    btn.classList.toggle('liked', liked);
    likesBase += liked ? 1 : -1;
    document.getElementById('likes-count').textContent = `${likesBase.toLocaleString()} Me gusta`;
    if (liked) {
      btn.style.transform = 'scale(1.3)';
      setTimeout(() => btn.style.transform = 'scale(1)', 150);
    }
  }

  // Bookmark
  function toggleBookmark() {
    bookmarked = !bookmarked;
    const btn = document.getElementById('bookmark-btn');
    btn.querySelector('svg').style.fill = bookmarked ? '#fff' : 'none';
  }

  // Caption expandible
  const captionFull = {CAPTION_FULL_JS};
  const captionShort = {CAPTION_SHORT_JS};
  const hashtagsEl = document.getElementById('hashtags');
  const captionTextEl = document.getElementById('caption-text');
  const captionToggleEl = document.getElementById('caption-toggle');

  function toggleCaption() {
    captionExpanded = !captionExpanded;
    captionTextEl.textContent = captionExpanded ? captionFull : captionShort;
    hashtagsEl.style.display = captionExpanded ? 'block' : 'none';
    captionToggleEl.textContent = captionExpanded ? ' menos' : ' más';
  }

  updateCarousel();
</script>
</body>
</html>
```

---

## Variables a sustituir en el HTML

| Variable | Valor |
|----------|-------|
| `{CAROUSEL_TOPIC}` | Tema del carrusel (texto) |
| `{BRAND}` | `brand_name` del perfil |
| `{BRAND_INITIALS}` | Iniciales del brand (máx 2 letras, ej: "MC") |
| `{HANDLE}` | `handle` del perfil (con @) |
| `{HANDLE_CLEAN}` | handle sin @ |
| `{PRIMARY}` | `colors.primary` del perfil |
| `{TEXT_LIGHT}` | `colors.text_light` del perfil |
| `{STORY_COLOR}` | Igual a `colors.primary` |
| `{NICHE_LABEL}` | Nicho corto (máx 30 chars) |
| `{TOTAL_SLIDES}` | Número total de slides (ej: 7) |
| `{SLIDES_HTML}` | Un `<div class="carousel-slide"><img src="slide-0N-nombre.svg" loading="lazy" alt="Slide N"/></div>` por cada slide |
| `{DOTS_HTML}` | Un `<div class="dot active" data-index="0"></div>` por cada slide (solo el primero lleva `active`) |
| `{LIKES_COUNT}` | Número aleatorio entre 847 y 3.241 formateado con coma (ej: "1,284") |
| `{LIKES_BASE}` | Mismo número sin formato (para JS) |
| `{COMMENTS_COUNT}` | Número aleatorio entre 23 y 187 |
| `{CAPTION_SHORT}` | Primeras 120 chars del caption sin hashtags |
| `{CAPTION_FULL_JS}` | Caption completo sin hashtags como string JS (entre backticks, escapar caracteres especiales) |
| `{CAPTION_SHORT_JS}` | Mismos 120 chars como string JS |
| `{HASHTAGS_HTML}` | Hashtags separados por espacios con HTML: `#hashtag1 #hashtag2 ...` |
| `{TIME_AGO}` | Texto como "HACE 2 HORAS" o "HACE 1 DÍA" |

## Ejemplo de SLIDES_HTML

```html
<div class="carousel-slide"><img src="slide-01-hook.svg" loading="lazy" alt="Slide 1 - Hook"/></div>
<div class="carousel-slide"><img src="slide-02-problema.svg" loading="lazy" alt="Slide 2 - Problema"/></div>
<div class="carousel-slide"><img src="slide-03-punto-1.svg" loading="lazy" alt="Slide 3 - Punto 1"/></div>
```

## Ejemplo de DOTS_HTML

```html
<div class="dot active" data-index="0"></div>
<div class="dot" data-index="1"></div>
<div class="dot" data-index="2"></div>
<div class="dot" data-index="3"></div>
```
