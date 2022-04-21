
{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
  ];
  # Install all the packages
  environment.systemPackages = with pkgs; [
    #cli
    fish neovim wget exa thefuck gnome.zenity du-dust
    onefetch dconf htop neofetch
    #gui
    librewolf chromium google-chrome discord kate
    pavucontrol tdesktop blockbench-electron
    #dev
    git gitkraken go jdk
    #archive
    unzip unrar p7zip
    #libs
    libusb1 wine ffmpeg openssl
    #games
    polymc lutris steam
  ];
}
