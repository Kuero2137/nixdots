{ pkgs, config, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
    };
  };

  programs.zsh = {
    enable = true;

    # Set dotDir
    dotDir = ".home/cli/zsh";

    # .zshrc
    # initExtra = ''
    #
    # '';

    # Aliases
    shellAliases = {
      v = "nvim";
      c = "clear";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" "golang" ];
    };
    plugins = [
      {
        name = "zsh-autocomplete";
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "d6a0ff574679280af52258ee6d2dcd3857283270";
          sha256 =  "w5lsRLeI8p8qPJl2n2YUdc+74M8jU3NIshhB89aOejk=";
        };
      }
    ];

    # Tweak settings for history
    history = {
      save = 1000;
      size = 1000;
      path = "$HOME/.cache/zsh_history";
    };
  };
}
