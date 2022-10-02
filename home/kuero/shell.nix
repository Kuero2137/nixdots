{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    initExtra = ''
      if [[ -a $HOME/.p10k.zsh ]]; then
        source $HOME/.p10k.zsh
      fi
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };

    shellAliases = {
      rm = "rm -fr";
      c = "clear";
      fetch = "neofetch";
      rebuild = "nixos-rebuild switch --use-remote-sudo --flake .#JD-PC";
    };
  };
}
