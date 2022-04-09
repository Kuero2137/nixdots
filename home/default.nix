{ inputs, config, pkgs, ... }:
{
  imports = [
    ./cli/zsh
    ./cli/git
    ./others

    ./programs/kitty
  ];
}
