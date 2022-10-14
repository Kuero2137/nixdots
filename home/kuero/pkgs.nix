{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    tdesktop discord htop libreoffice yt-dlp p7zip
    ookla-speedtest filezilla firefox neofetch
    ffmpeg gitkraken qbittorrent dwarfs fuse-overlayfs
    nicotine-plus niv slack mongodb-compass
    #gaming
    wine-staging lutris grapejuice
    #others
    (callPackage ./packages/tidal-dl.nix {})
  ];
}
