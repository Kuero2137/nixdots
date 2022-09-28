{ config, pkgs, ... }:

{
  home-manager.users.kuero = {
    imports = [
      ./shell.nix
    ];
  };
}
