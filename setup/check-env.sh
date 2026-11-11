#!/usr/bin/env bash
# Verifica las herramientas necesarias. No imprime secretos ni llaves.
# Uso: bash setup/check-env.sh
set -u
ok=0; fail=0
say_ok()   { printf '  [OK]    %s\n' "$1"; ok=$((ok+1)); }
say_miss() { printf '  [FALTA] %s\n' "$1"; fail=$((fail+1)); }
say_warn() { printf '  [AVISO] %s\n' "$1"; }

have() { command -v "$1" >/dev/null 2>&1; }

echo "Verificando entorno..."

if have node; then
  v=$(node -v | sed 's/^v//'); major=${v%%.*}; rest=${v#*.}; minor=${rest%%.*}
  if [ "$major" -gt 22 ] 2>/dev/null || { [ "$major" = "22" ] && [ "$minor" -ge 12 ]; }; then say_ok "node $v"
  else say_miss "node $v (se requiere >= 22.12)"; fi
else say_miss "node"; fi

if have pnpm; then say_ok "pnpm $(pnpm -v)"; else say_miss "pnpm (corepack enable && corepack prepare pnpm@10 --activate)"; fi
if have git;  then say_ok "git $(git --version | awk '{print $3}')"; else say_miss "git"; fi

if have gh; then say_ok "gh $(gh --version | head -n1 | awk '{print $3}')"
elif [ -x /snap/bin/gh ]; then say_warn "gh está en /snap/bin/gh pero no en el PATH; agregar /snap/bin al PATH"
else say_miss "gh (GitHub CLI)"; fi

if have wrangler; then say_ok "wrangler $(wrangler --version 2>/dev/null | head -n1)"
elif have npx; then say_warn "wrangler no está instalado globalmente; se puede usar 'pnpm dlx wrangler'"
else say_miss "wrangler"; fi

if have neonctl; then say_ok "neonctl $(neonctl --version 2>/dev/null | head -n1)"
else say_warn "neonctl no instalado (npm i -g neonctl); se necesita en la Fase 2"; fi

if have openssl; then say_ok "openssl"; else say_miss "openssl"; fi
if have docker; then say_ok "docker (opcional)"; else say_warn "docker no instalado (opcional: se puede usar PGlite y una rama de Neon)"; fi
if have claude; then say_ok "claude (Claude Code)"; else say_warn "claude no está en el PATH de este shell"; fi

echo
echo "Sesiones (solo estado, sin mostrar tokens):"
if have gh; then gh auth status >/dev/null 2>&1 && say_ok "gh con sesión iniciada" || say_warn "gh sin sesión: ejecutar 'gh auth login'"; fi
if have wrangler; then wrangler whoami >/dev/null 2>&1 && say_ok "wrangler con sesión iniciada" || say_warn "wrangler sin sesión: ejecutar 'wrangler login'"; fi
if have neonctl; then neonctl me >/dev/null 2>&1 && say_ok "neonctl con sesión iniciada" || say_warn "neonctl sin sesión: ejecutar 'neonctl auth'"; fi

echo
echo "Resultado: $ok correctos, $fail faltantes."
[ "$fail" -eq 0 ] || exit 1
