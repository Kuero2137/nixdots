{ pkgs, config, ... }:

{
  programs.home-manager.enable = true;
  dconf.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  xdg.userDirs = {
    enable = true;
    documents = "$HOME/stuff/other/";
    download = "$HOME/stuff/downloads/";
    videos = "$HOME/stuff/other/";
    music = "$HOME/stuff/other/";
    pictures = "$HOME/stuff/pics/";
    desktop = "$HOME/stuff/desktop/";
    publicShare = "$HOME/stuff/other/";
    templates = "$HOME/stuff/other/";
  };

  programs.gpg = {
    enable = true;
  };
  home.stateVersion = "21.11";
}
