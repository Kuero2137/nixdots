{ pkgs, config, ... }:

<<<<<<< HEAD:home/others/default.nix
{
  programs.home-manager.enable = true;
=======
let
  zshsettings = import ./zsh/zsh.nix;

in {
  programs.home-manager.enable = true;
  programs.zsh = zshsettings pkgs;
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
    };
  };

>>>>>>> testing:config/home.nix
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
<<<<<<< HEAD:home/others/default.nix
=======
      programs.git = {
        enable = true;
        userName = "Kuero2137";
        userEmail = "kuero@protonmail.ch";
        extraConfig = {
            init = { defaultBranch = "main"; };
            core = {
                excludesfile = "$NIXOS_CONFIG_DIR/scripts/gitignore";
            };
        };
    };
>>>>>>> testing:config/home.nix

  programs.gpg = {
    enable = true;
  };
<<<<<<< HEAD:home/others/default.nix
  home.stateVersion = "21.11";
=======

    home.stateVersion = "21.11";
>>>>>>> testing:config/home.nix
}
