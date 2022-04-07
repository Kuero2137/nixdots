{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
  ];
  # Install all the packages
  environment.systemPackages = with pkgs; [
    #cli
    fish neovim wget
    #gui
    gitkraken firefox google-chrome discord
    #dev
    git
  ];
}
