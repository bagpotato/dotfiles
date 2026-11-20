{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    serpantinum.url = "github:ilyamiro/serpantinum";
    claude-desktop = {
      url = "github:aaddrick/claude-desktop-debian";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, serpantinum, claude-desktop, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit serpantinum; };
      modules = [
        ./configuration.nix
        serpantinum.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          nixpkgs.config.allowUnfree = true;
          environment.systemPackages = [
            claude-desktop.packages.x86_64-linux.claude-desktop-fhs
          ];
        }
      ];
    };
  };
}
