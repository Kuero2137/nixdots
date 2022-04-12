{ config, pkgs, lib, theme, ... }:

with lib;
let theme = import ./theme;
in {
  environment.variables = {
    NIXOS_CONFIG = "$HOME/.config/nixos/configuration.nix";
    NIXOS_CONFIG_DIR = "$HOME/.config/nixos/";
    EDITOR = "nvim";
    TERMINAL = "kitty";
    BROWSER = "google-chrome-stable";
  };

  nix = {
    autoOptimiseStore = true;
    allowedUsers = [ "kuero" ];
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 4d";
    };
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  hardware = {
    opengl.driSupport32Bit = true;
    pulseaudio.support32Bit = true;
  };

  environment.defaultPackages = [ ];
  nixpkgs.config.allowUnfree = true;

  boot = {
    cleanTmpDir = true;
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 0;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      };
    };

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "pl_PL.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "pl";
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  services = {
    logind = {
      lidSwitch = "lock";
    };

    xserver = {
      enable = true;
      layout = "pl";
      xkbOptions = "caps:swapescape";
      videoDrivers = [ "amdgpu" ];
      enableTCP = false;
      exportConfiguration = false;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = false;
      };
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
#      displayManager.lightdm.greeters.mini = with theme.colors; {
#        enable = true;
#        user = "kuero";
#        extraConfig =
#          "\n          [greeter]\n          show-password-label = false\n          invalid-password-text = Access Denied\n          show-input-cursor = true\n          password-alignment = left\n          [greeter-hotkeys]\n          mod-key = meta\n          shutdown-key = s\n          [greeter-theme]\n          font-size = 1em\n          font = \"monospace\";\n          background-image = \"\"\n          background-color = \"#${bg}\"\n          window-color = \"#${bg}\"\n          password-border-radius = 10px\n          password-border-width = 3px\n          password-border-color = \"#${ac}\"\n          password-background-color = \"#${bg}\"\n          border-width = 0px\n          text-color = \"#${ac}\"\n          ";
#      };
      windowManager.bspwm.enable = true;

      libinput = {
        enable = true;
        mouse = {
          accelProfile = "flat";
          accelSpeed = "0";
          middleEmulation = false;
        };
      };
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
  };
  users.users.kuero = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] ++ optionals config.services.xserver.enable [
      "audio"
      "video"
      "lp"
      "networkmanager"
    ];
    uid = 1000;
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  fonts = {
    fonts = with pkgs; [
      jetbrains-mono
      material-design-icons
      roboto
      source-sans
      twemoji-color-font
      comfortaa
      inter
      iosevka
      lato
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
    ];
    enableDefaultFonts = false;

    fontconfig = with theme.colors; {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
        sansSerif = [ "Lato" "Noto Color Emoji" ];
        serif = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    allowReboot = false;
  };
  system.stateVersion = "21.11";
}
