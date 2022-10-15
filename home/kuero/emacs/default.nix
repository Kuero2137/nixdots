{ pkgs, config, inputs, ... }:

{
  prorgams.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
    emacsPackage = pkgs.emacsPgtkNativeComp;
  };
}
  
