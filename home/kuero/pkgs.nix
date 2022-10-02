{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    tdesktop discord htop libreoffice yt-dlp p7zip
    ookla-speedtest filezilla firefox neofetch
    ffmpeg gitkraken qbittorrent dwarfs fuse-overlayfs
    #gaming
    wine-staging lutris grapejuice
  ];
}
