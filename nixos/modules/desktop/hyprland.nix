{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  # Instalar el tema de iconos del cursor Adwaita
  environment.systemPackages = [ pkgs.adwaita-icon-theme ];

  # Variables de entorno críticas para NVIDIA (RTX 50-series) en Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    
    # Forzar el cursor normal en lugar de la mascota de Hyprland
    XCURSOR_THEME = "WhiteSur-cursors";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_SIZE = "24";
  };
}
