{ serpantinum, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = { inherit serpantinum; };
    users.bag = import ../home;
  };
}
