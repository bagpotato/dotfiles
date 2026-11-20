{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    wl-clipboard
    cliphist
  ];

  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;
}
