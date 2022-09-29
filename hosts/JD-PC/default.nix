{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./home
  ];
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      systemd-boot.enable = true;
      efi = {
        efiSysMountPoint = "/boot/efi";
        canTouchEfiVariables = true;
      };
      timeout = 1;
    };
  };
  networking = {
    hostName = "JD-PC";
    networkmanager.enable = true;
  };
  systemd.services.NetworkManager-wait-online.enable = false;
  users.users.kuero = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh;
  };
  time.timeZone = "Europe/Warsaw";
  nix.settings.trusted-users = [ "kuero" ];
  environment = {
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      wget
      git
      tree
    ];
  };
  fonts.fonts = with pkgs; [
    jetbrains-mono
    roboto
    font-awesome
    corefonts
  ];
  services = {
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio.enable = false;
  };
  programs = {
    zsh = {
      enable = true;
      enableGlobalCompInit = false;
    };
    steam.enable = true;
  };
  security.pam.services.lightdm.enableGnomeKeyring = true;
  documentation.nixos.enable = false;
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "pl_PL.UTF-8";
      LC_MONETARY = "pl_PL.UTF-8";
    };
  };
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "pl";
    xkbVariant = "";
  };
  security.sudo.wheelNeedsPassword = false;
  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.05";
  };
}
