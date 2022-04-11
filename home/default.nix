{ inputs, config, pkgs, ... }:
{
  imports = [
    ./cli/zsh
    ./cli/git
    ./others

    ./desktop/bspwm
    ./desktop/gtk
    ./desktop/picom
    ./desktop/sxhkd
    ./desktop/xresources
    ./desktop/lockscreen
    ./desktop/eww

    ./programs/kitty
  ];
}
