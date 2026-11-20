{ pkgs, ... }:
{
  # Bash como shell por defecto para bag (Fish eliminado)
  users.users.bag.shell = pkgs.bashInteractive;

  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    # Editores y herramientas de consola
    micro
    starship
    eza
    bat
    sassc
    fastfetch
    

    # Desarrollo
    vscode
    python3
    nautilus

    # Multimedia
    spotify
    vlc
    obs-studio

    # Social
    discord
  ];
}
