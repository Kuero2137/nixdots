
{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
  ];
  # Install all the packages
  environment.systemPackages = with pkgs; [
    #cli
<<<<<<< HEAD:home/packages.nix
    fish neovim wget exa thefuck gnome.zenity du-dust
    onefetch
    #gui
    librewolf google-chrome discord kate
    #dev
    git gitkraken go
    #archive
    unzip unrar p7zip
    #libs
    libusb1 wine ffmpeg openssl
    #games
    polymc lutris
=======
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
>>>>>>> testing:config/packages.nix
  ];
}
