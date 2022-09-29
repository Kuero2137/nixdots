{ inputs, ... }:

{
  home.stateVersion = "22.05";
  imports = [
    ./pkgs.nix
    ./ssh.nix
    ./xdg.nix
  ];
}
