{ config, pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      jnoortheen.nix-ide
      golang.go
      tabnine.tabnine-vscode
    ];
  };
}
