{
  config,
  lib,
  pkgs,
  ...
}: {
  services = {
    openssh = {enable = true;};
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = [pkgs.xterm];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
  boot = {
    initrd.kernelModules = ["wl"];
    kernelModules = ["wl"];
    extraModulePackages = with config.boot.kernelPackages; [broadcom_sta];
  };

  networking = {
    hostName = "nixos-live";
    wireless = {
      enable = false;
      iwd.enable = true;
    };
  };

  hardware.pulseaudio.enable = false;

  environment = {
    gnome.excludePackages = with pkgs; [
      gnome-photos
      gedit
      gnome-tour
      cheese
      gnome-music
      gnome-terminal
      gnome-characters
      epiphany
      geary
      evince
      totem
      tali
      atomix
      hitori
    ];
    systemPackages = with pkgs; [
      parted
      disko
      git
      gh
      gtop
      fastfetch
      neovim
      mc
      yazi

      pciutils
      lshw
      networkmanager
      nmap
      #wezterm
      alacritty

      btrfs-progs
      chromium
    ];
  };

  nixpkgs.hostPlatform = {system = "x86_64-linux";};

  system.stateVersion = "25.05";
}
