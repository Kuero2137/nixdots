{ config, pkgs, ... }:

let
  nvimsettings = import ./nvim/nvim.nix;

in {
  programs.home-manager.enable = true;
  programs.neovim = nvimsettings pkgs;

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
      programs.git = {
        enable = true;
        userName = "Kuero2137";
        userEmail = "kuero@protonmail.ch";
        extraConfig = {
            init = { defaultBranch = "master"; };
            core = {
                excludesfile = "$NIXOS_CONFIG_DIR/scripts/gitignore";
            };
        };
    };

    home.stateVersion = "21.11";
}
