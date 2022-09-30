{ config, pkgs, inputs, hyprland, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
  };
}