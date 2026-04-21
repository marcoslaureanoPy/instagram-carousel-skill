# Instagram Carousel Skill — Installer for Windows (PowerShell)
# https://github.com/pyneuraLLC/instagram-carousel-skill

$SkillDir = "$env:USERPROFILE\.claude\skills\instagram-carousel"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  Instagram Carousel Skill — Claude Code" -ForegroundColor Cyan
Write-Host "  by pyneuraLLC" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

# Check Claude Code
$claudeExists = Get-Command claude -ErrorAction SilentlyContinue
if (-not $claudeExists) {
    Write-Host "⚠️  Claude Code no encontrado en el PATH." -ForegroundColor Yellow
    Write-Host "   Instálalo desde: https://claude.ai/code" -ForegroundColor Yellow
    Write-Host "   La skill se instalará de todas formas." -ForegroundColor Yellow
    Write-Host ""
}

# Create directories
Write-Host "📁 Instalando en: $SkillDir" -ForegroundColor White
New-Item -ItemType Directory -Force -Path "$SkillDir\rules" | Out-Null

# Copy files
Copy-Item "$ScriptDir\skill\SKILL.md" "$SkillDir\SKILL.md" -Force
Copy-Item "$ScriptDir\skill\rules\*.md" "$SkillDir\rules\" -Force

Write-Host "✅ Skill instalada correctamente." -ForegroundColor Green
Write-Host ""
Write-Host "Próximos pasos:" -ForegroundColor White
Write-Host "  1. Reinicia Claude Code" -ForegroundColor Gray
Write-Host "  2. Escribe: /instagram-carousel" -ForegroundColor Gray
Write-Host ""
Write-Host "Primera vez: se iniciará el onboarding de tu marca." -ForegroundColor Gray
Write-Host ""
