{ pkgs, ... }:
let
  # Genera 30 frames del logo de NixOS rotando en 3D (perspectiva) en tonos rosa.
  frames = pkgs.runCommand "nixfetch-frames" {
    nativeBuildInputs = [
      pkgs.librsvg
      (pkgs.python3.withPackages (ps: [ ps.pillow ps.numpy ]))
    ];
  } ''
    svg=$(find ${pkgs.nixos-icons} -name 'nix-snowflake*.svg' ! -name '*white*' | head -n1)
    [ -n "$svg" ] || { echo "no encontré el svg del logo de NixOS"; exit 1; }
    rsvg-convert --keep-aspect-ratio -w 800 -h 800 "$svg" -o logo.png
    mkdir -p $out
    python3 ${./nixfetch/render.py} logo.png $out/frames.bin
  '';

  nixfetch = pkgs.writeShellScriptBin "nixfetch" (
    builtins.replaceStrings
      [ "@frames@" "@fastfetch@" ]
      [ "${frames}/frames.bin" "${pkgs.fastfetch}/bin/fastfetch" ]
      (builtins.readFile ./nixfetch/nixfetch.sh)
  );
in
{
  home.packages = [ nixfetch ];

  programs.fastfetch = {
    enable = true;
    settings = {
      logo.type = "none"; # el logo lo dibuja nixfetch
      display = {
        separator = " ♥ ";
        color = {
          keys = "38;2;255;173;199";
          title = "38;2;255;143;181";
          separator = "38;2;255;214;224";
        };
      };
      modules = [
        "title" "separator" "os" "host" "kernel" "uptime" "packages"
        "shell" "wm" "terminal" "cpu" "gpu" "memory" "disk" "break" "colors"
      ];
    };
  };
}
