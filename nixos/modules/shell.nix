{ ... }:
{
  environment.shellAliases = {
    ll = "ls -la";
    rebuild = "sudo nixos-rebuild switch";
  };
}
