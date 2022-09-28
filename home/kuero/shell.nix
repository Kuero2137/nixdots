{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtraFirst = ''
      setopt PROMPT_SUBST
      source ${pkgs.git}/share/bash-completion/completions/git-prompt.sh
      PROMPT='[%n@%m %~]%(!.#.$)$(__git_ps1) '
      RPROMPT=
    '';
    initExtra = ''
      setopt INTERACTIVE_COMMENTS
      # Disable pasted text highlighting 
      zle_highlight+=(paste:none)
      # Completion options
      zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' menu select
      zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
      zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
      zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
      zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
      zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
      zstyle ':completion:*' group-name ""
      # Quote pasted URLs
      autoload -U url-quote-magic
      zle -N self-insert url-quote-magic
    '';
    shellAliases = {
      ytdl = "yt-dlp";
    };
  };

  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile "${pkgs.fetchurl {
      url = "https://github.com/arcticicestudio/nord-dircolors/raw/addb3b427e008d23affc721450fde86f27566f1d/src/dir_colors";
      sha256 = "sha256-hlezTQqouVKbxgQBxtZU4en0idDiTCRJtFGH6XYFmtc="; }
    }";
  };
}

