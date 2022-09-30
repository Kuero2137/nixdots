{ config, pkgs, self, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
  };
}