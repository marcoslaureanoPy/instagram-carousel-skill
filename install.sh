#!/usr/bin/env bash
# Instagram Carousel Skill — Installer for Mac/Linux
# https://github.com/pyneuraLLC/instagram-carousel-skill

set -e

SKILL_DIR="$HOME/.claude/skills/instagram-carousel"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Instagram Carousel Skill — Claude Code"
echo "  by pyneuraLLC"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check Claude Code is installed
if ! command -v claude &> /dev/null; then
  echo "⚠️  Claude Code no encontrado en el PATH."
  echo "   Instálalo desde: https://claude.ai/code"
  echo "   La skill se instalará de todas formas."
  echo ""
fi

# Create skill directory
echo "📁 Instalando en: $SKILL_DIR"
mkdir -p "$SKILL_DIR/rules"

# Copy files
cp "$SCRIPT_DIR/skill/SKILL.md" "$SKILL_DIR/SKILL.md"
cp "$SCRIPT_DIR/skill/rules/"*.md "$SKILL_DIR/rules/"

echo "✅ Skill instalada correctamente."
echo ""
echo "Próximos pasos:"
echo "  1. Reinicia Claude Code"
echo "  2. Escribe: /instagram-carousel"
echo ""
echo "Primera vez: se iniciará el onboarding de tu marca."
echo ""
