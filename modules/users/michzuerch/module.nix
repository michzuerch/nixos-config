{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.custom.users.michzuerch;
in {
  options.custom.users.michzuerch = {enable = mkEnableOption "users.michzuerch";};

  config = mkIf cfg.enable {
    users.users = {
      michzuerch = {
        isNormalUser = true;
        extraGroups = ["wheel" "podman" "docker" "audio" "video" "networkmanager"];
        shell = pkgs.zsh;
      };
    };
  };
}
