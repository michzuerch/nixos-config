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
    home = {
      username = "michzuerch";
      homeDirectory = "/home/michzuerch";
    };

    programs.git = {
      userEmail = "michzuerch@gmail.com";
      userName = "Michael Zuercher";
    };
  };
}
