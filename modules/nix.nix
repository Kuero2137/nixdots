{ config, pkgs, inputs, ... }:

{
  nix = {
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "@wheel" ];
    };
  };
  nixpkgs.overlays = [ inputs.nur.overlay ];
  nixpkgs.config.allowUnfree = true;
}
