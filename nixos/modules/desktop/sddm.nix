{ pkgs, ... }:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "japanese_aesthetic";
  };
in
{
  services.xserver.enable = true;

  environment.systemPackages = [ sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = [ pkgs.kdePackages.qtmultimedia ];
    theme = "sddm-astronaut-theme";
    wayland.enable = false;
  };
}
