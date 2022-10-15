{ pkgs, inputs, nix-doom-emacs, ... }:

{
  home.stateVersion = "22.05";
  imports = [
    ./pkgs.nix
    ./ssh.nix
    ./xdg.nix
    ./vsc.nix
    ./shell.nix
    ./terminal.nix
    ./desktop/hyprland
    nix-doom-emacs.hmModule ./emacs
    #./desktop/swaylock
  ];
}
