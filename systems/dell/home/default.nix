{
  outputs,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.hyprland-addons

    ../default.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  programs = {
    hyprland-addons.enable = true;
    eww = {
      enable = true;
      configDir = ./eww;
    };
  };

  home.packages = with pkgs; [
    htop
    fd
    ripgrep
    lazygit
    tree-sitter
    unzip
    p7zip
    wget
    imv
    pavucontrol
    ungoogled-chromium
    libreoffice-fresh
    protonup-qt
    protontricks
    wineWowPackages.waylandFull
    vlc
    vesktop
    remmina
    luajit
    stremio
  ];

  home.stateVersion = "25.05";
}
