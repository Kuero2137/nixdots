{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };
        bold = {
          family = "JetBrains Mono";
          style = "Bold";
        };
        italic = {
          family = "JetBrains Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrains Mono";
          style = "Bold Italic";
        };
        size = 16;
      };
      colors = {
        primary = {
          background = "#1E1E28";
          foreground = "#6E6C7C";
        };
        cursor = {
          text = "#1E1E28";
          cursor = "#6E6C7C";
        };
        vi_mode_cursor = {
          text = "#1E1E28";
          cursor = "#6E6C7C";
        };
        selection = {
          text = "CellForeground";
          background = "#575268";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "#B5E8E0";
          };
          footer_bar = {
            background = "#302D41";
            foreground = "#6E6C7C";
          };
        };
        normal = {
          black = "#1A1826";
          red = "#F28FAD";
          green = "#ABE9B3";
          yellow = "#FAE3B0";
          blue = "#96CDFB";
          magenta = "#DDB6F2";
          cyan = "#B5E8E0";
          white = "#D7DAE0";
        };
        bright = {
          black = "#575268";
          red = "#F28FAD";
          green = "#ABE9B3";
          yellow = "#FAE3B0";
          blue = "#96CDFB";
          magenta = "#DDB6F2";
          cyan = "#C9CBFF";
          white = "#F5E0DC";
        };
      };
    };
  };
}