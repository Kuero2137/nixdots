{ config, pkgs, lib, ... }:
{
  xdg.userDirs = {
    enable = true;
    videos = "$HOME/stuff/pics";
    pictures = "$HOME/stuff/pics";
    templates = "$HOME/stuff/oth";
    publicShare = "$HOME/stuff/oth";
    music = "$HOME/stuff/music";
    download = "$HOME/stuff/dl";
    documents = "$HOME/stuff/docs";
    desktop = "$HOME/stuff/desk";
  };
}
