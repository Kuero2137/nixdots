{ config, pkgs, theme, fetchurl, ... }:

{
  home.packages = with pkgs; [ feh ];

  home.file.".local/backgrounds/wallpaper.png".source =
    ../../../theme/wallpaper.png;

  home.keyboard = {
    layout = "pl";
    options = [ "caps:swapescape" ];
  };

  xsession = {
    enable = true;
    pointerCursor = {
      package = pkgs.catppuccin-cursors;
      name = "Catppuccin-Dark-Cursors";
      size = 24;
    };
    windowManager.bspwm = {
      enable = true;
      startupPrograms = [
        "feh --bg-fill ~/.local/backgrounds/wallpaper.png"
        "xrandr --output DisplayPort-1 --primary --mode 2560x1440 --rate 74.97 --rotate normal --output HDMI-A-0 --mode 1680x1050 --rate 60 --rotate normal --right-of DisplayPort-1"
        "pgrep bspswallow || bspswallow"
        "xsetroot -cursor_name left_ptr"
        "eww daemon && eww open bar"
      ];
      settings = with theme.colors; {
        remove_disabled_monitors = true;
        remove_unplugged_monitors = true;
        ignore_ewmh_focus = true;
        focus_follows_pointer = true;
        border_width = 2;
        window_gap = 12;
        top_padding = 50;
        focused_border_color = "#${c6}";
        split_ratio = 0.618;
        urgent_border_color = "#${c3}";
        normal_border_color = "#${bg}";
        presel_feedback_color = "#${c6}";
      };
      monitors = { "focused" = [ "1" "2" "3" "4" "5" "6" ]; };

      rules = {
        "Zathura" = { state = "tiled"; };
        "Pavucontrol" = { state = "floating"; };
        "Pcmanfm" = { state = "floating"; };
        "pavucontrol" = { state = "floating"; };
        "transmission-gtk" = { state = "floating"; };

        "csgo_linux64" = {
          desktop = "^4";
          follow = true;
        };
        "lutris" = {
          desktop = "^4";
          follow = false;
          state = "floating";
        };
        "PolyMC" = {
          state = "floating";
        };
        "steam" = {
          desktop = "^4";
          follow = false;
          state = "floating";
        };
        "minecraft-launcher" = {
          desktop = "^4";
          follow = true;
          state = "floating";
          center = true;
        };
        "Discord" = {
          desktop = "^3";
          follow = true;
          state = "floating";
        };
        "telegram-desktop" = {
          desktop = "^3";
          follow = true;
        };
      };
    };
  };

}
