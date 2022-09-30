{ config, pkgs, inputs, hyprland, ... }:

{
  programs.hyprland = {
    enable = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
  };
}