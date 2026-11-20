{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/nix.nix
    ./modules/boot.nix
    ./modules/cpu.nix
    ./modules/nvidia.nix
    ./modules/time.nix
    ./modules/locale.nix
    ./modules/network.nix
    ./modules/users.nix
    ./modules/desktop
    ./modules/apps
    ./modules/ollama.nix
    ./modules/home.nix
    ./modules/shell.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";
  system.stateVersion = "26.05";
}
