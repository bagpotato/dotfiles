{ pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.whitesur-cursors;
    name = "WhiteSur-cursors";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme.override {
        colorVariants = [ "dark" ];
        opacityVariants = [ "normal" ];
        themeVariants = [ "default" ];
      };
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  # Forzar el tema en aplicaciones GTK4/Libadwaita como Nautilus
  home.sessionVariables = {
    GTK_THEME = "WhiteSur-Dark";
  };
}
