{ config, pkgs, ... }:

{
  imports =
    [
      ./hosts/JD-PC.nix
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users.defaultUserShell = pkgs.zsh;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "JD-PC"; # Define your hostname.

  time.timeZone = "Europe/Warsaw";

  networking.useDHCP = false;
  networking.interfaces.enp8s0.useDHCP = true;

  i18n.defaultLocale = "pl_PL.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pl";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  services.xserver.layout = "pl";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.kuero = {
    isNormalUser = true;
    initialPassword = "boni";
    extraGroups = [ "wheel" ];
  };

  system.stateVersion = "21.11";

}

