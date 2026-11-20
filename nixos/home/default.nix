{ pkgs, serpantinum, ... }:

{
  imports = [
    serpantinum.homeManagerModules.default
    ./hyprland.nix
    ./serpantinum.nix
    ./theme.nix
    ./kitty.nix
    ./starship.nix
    ./micro.nix
    ./nixfetch.nix
    ./btop.nix
  ];

  home.stateVersion = "26.05";
  home.username = "bag";
  home.homeDirectory = "/home/bag";

  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "eza --icons";
      ll = "eza -la --icons";
      cat = "bat";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/";
      edit-config = "micro /etc/nixos/configuration.nix";
    };

    initExtra = ''
      if [ -z "$NIXFETCH_SKIP" ]; then nixfetch; fi
    '';
  };
}
