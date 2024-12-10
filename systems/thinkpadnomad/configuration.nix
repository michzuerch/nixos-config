{pkgs, ...}: {
  imports = [./hardware-configuration.nix];

  networking.hostName = "thinkpadnomad";

  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod;
    kernelModules = ["i2c-dev"];
  };

  boot.loader = {
    #efi.canTouchEfiVariables = true;
    #systemd-boot = {
    #  enable = true;
    #  configurationLimit = 8;
    #};
    grub = {
      enable = true;
      device = "/dev/vda";
    };
  };

  hardware.graphics.enable32Bit = true;

  services = {
    udev.packages = with pkgs; [openrgb-with-all-plugins];
    fstrim.enable = true;
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      displayManager.lightdm.enable = false;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      autoPrune.enable = true;
    };
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  programs = {
    java.enable = true;
    dconf.enable = true;
    firefox = {
      enable = true;
      preferences = {"widget.use-xdg-desktop-portal.file-picker" = 1;};
    };
    kdeconnect.enable = true;
    yazi.enable = true;
    nix-ld.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [virt-manager man-pages man-pages-posix];
  };

  system.stateVersion = "25.05";
}
