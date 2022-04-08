{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
  ];
  # Install all the packages
  environment.systemPackages = with pkgs; [
    #cli
    fish neovim wget exa thefuck
    antigen
    #gui
    gitkraken firefox google-chrome discord kate
    #dev
    git
    #archive
    unzip unrar p7zip
    #libs
    libusb1
    #languages
    go
  ];
}
