{ inputs, config, pkgs, ... }:
{
  imports = [
    ./cli/bat
    ./cli/fzf
    ./cli/git
    ./cli/gpg
    ./cli/lf
    ./cli/cava
    ./cli/music
    ./cli/nvim
    ./cli/pass
    ./cli/direnv
    ./cli/zsh

    ./desktop/bspwm
    ./desktop/gtk
    ./desktop/picom
    ./desktop/sxhkd
    ./desktop/xresources
    ./desktop/lockscreen
    ./desktop/eww

    ./programs/kitty
    ./programs/dunst
    ./programs/flameshot
    ./programs/rofi

    ./others
  ];
}
