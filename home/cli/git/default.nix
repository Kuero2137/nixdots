{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "Kuero2137";
    userEmail = "kuero@protonmail.ch";
    extraConfig = { init = { defaultBranch = "main"; }; };
  };
}
