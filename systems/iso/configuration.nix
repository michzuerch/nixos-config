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
    #kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 0;
    initrd = {
      enable = true;
      systemd.enable = true;
      verbose = false;
      availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "sd_mod"];
    };
    kernelModules = ["kvm-intel"];
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nowatchdog"
    ];
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
