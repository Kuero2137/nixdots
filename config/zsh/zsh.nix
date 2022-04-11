pkgs:
{
  enable = true;

  # Set dotDir
  dotDir = ".config/zsh";

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
    theme = "intheloop";
  };
  plugins = [
    {
      name = "zsh-autocomplete";
      src = pkgs.fetchFromGitHub {
        owner = "marlonrichert";
        repo = "zsh-autocomplete";
        rev = "d6a0ff574679280af52258ee6d2dcd3857283270";
        sha256 = "w5lsRLeI8p8qPJl2n2YUdc+74M8jU3NIshhB89aOejk=";
      };
    }
  ];

  # Tweak settings for history
  history = {
    save = 1000;
    size = 1000;
    path = "$HOME/.cache/zsh_history";
  };
}
