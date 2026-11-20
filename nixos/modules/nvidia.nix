{ config, ... }:
{
  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    open = true; # Obligatorio y recomendado para series RTX 40/50
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}