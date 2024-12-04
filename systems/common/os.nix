{pkgs, ...}: {
  networking.networkmanager.enable = true;
  systemd.extraConfig = "\n    DefaultTimeoutStopSec=10s\n    ";

  time.timeZone = "Europe/Busingen";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  boot.tmp.cleanOnBoot = true;
  security.polkit.enable = true;
  programs.git.enable = true;

  custom = {
    zsh.enable = true;
    nix.enable = true;
    themes.enable = true;
    #users.smj.enable = true;
    users.michzuerch.enable = true;
  };

  documentation = {
    dev.enable = true;
    man = {
      enable = true;
      generateCaches = true;
    };
  };

  environment = {systemPackages = with pkgs; [eza libclang gcc gnumake];};
}
