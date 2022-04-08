pkgs:
{
  enable = true;

  # Set dotDir
  dotDir = ".config/zsh";

  # .zshrc
  initExtra = ''
    antigen bundle zsh-users/zsh-syntax-highlighting
  '';

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

  # Tweak settings for history
  history = {
    save = 1000;
    size = 1000;
    path = "$HOME/.cache/zsh_history";
  };
}
