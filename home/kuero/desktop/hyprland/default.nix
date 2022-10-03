{ config, pkgs, ... }:

{
  config.home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  config.home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-Frappe-Dark";
    size = 16;

    gtk.enable = true;
  };
}