#!/usr/bin/env bash
# fastfetch con el logo de NixOS girando en 3D (frames precalculados)
FRAMES="@frames@"
LOOPS="${NIXFETCH_LOOPS:-2}"      # vueltas completas
DELAY="${NIXFETCH_DELAY:-0.04}"   # segundos entre frames
LOGO_W=36
LOGO_H=18

[[ -t 1 ]] || exit 0

mapfile -t info < <(@fastfetch@ --logo none --pipe false)
mapfile -d '' frames < "$FRAMES"

H=$(( ${#info[@]} > LOGO_H ? ${#info[@]} : LOGO_H ))
COL=$(( LOGO_W + 3 ))

printf '\e[?25l'
trap 'printf "\e[0m\e[?25h"' EXIT INT

# reservar espacio y volver arriba
for ((i = 0; i < H; i++)); do printf '\n'; done
printf '\e[%dA' "$H"

draw() {  # $1 = frame, $2 = 1 para dibujar también la info
  local rows i
  mapfile -t rows <<< "${frames[$1]}"
  for ((i = 0; i < H; i++)); do
    printf '\e[1G%s' "${rows[i]:-}"
    if [[ $2 == 1 && -n ${info[i]:-} ]]; then
      printf '\e[%dG%s\e[0m' "$COL" "${info[i]}"
    fi
    printf '\n'
  done
  printf '\e[%dA' "$H"
}

draw 0 1
total=$(( ${#frames[@]} * LOOPS ))
for ((n = 1; n <= total; n++)); do
  # cualquier tecla corta la animación
  if read -rsn1 -t "$DELAY" _; then break; fi
  draw $(( n % ${#frames[@]} )) 0
done
draw 0 0
printf '\e[%dB' "$H"
