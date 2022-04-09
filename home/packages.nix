
{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
  ];
  # Install all the packages
  environment.systemPackages = with pkgs; [
    #cli
    fish neovim wget exa thefuck gnome.zenity
    #gui
    firefox google-chrome discord kate
    #dev
    git gitkraken go
    #archive
    unzip unrar p7zip
    #libs
    libusb1
    #games
    polymc lutris steam
  ];
}
