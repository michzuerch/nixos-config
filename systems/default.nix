{inputs, ...}: let
  mkNixos = args: let
    inherit (builtins) attrNames attrValues elem;
    # moduleSet: Function that takes inputs as args and return a
    # set that has all custom osModules, homeModules, pkgs.
    moduleSet = import ../modules {inherit inputs;};
  in
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules =
        args.modules
        or []
        ++ [
          ../systems/common/os.nix
          inputs.home-manager.nixosModules.home-manager
          {
            config.nixpkgs = {
              overlays = [inputs.self.overlays.unstable inputs.nurpkgs.overlay];
              config = {allowUnfree = true;};
            };
          }
        ]
        ++ (
          if (elem "home" (attrNames args))
          then [
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {inherit inputs;};
                users.michzuerch = {
                  pkgs,
                  config,
                  ...
                }:
                  import args.home {inherit inputs pkgs config;}
                  // import ../systems/common/hm.nix {inherit inputs pkgs config;};
                sharedModules =
                  [inputs.nix-index-database.hmModules.nix-index]
                  ++ attrValues moduleSet.homeModules;
              };
            }
          ]
          else []
        )
        ++ attrValues moduleSet.osModules;
    };
in {
  thinkpadnomad = mkNixos {
    modules = [./thinkpadnomad/configuration.nix];
    home = ./thinkpadnomad/home;
  };
  frost = mkNixos {
    modules = [./frost/configuration.nix];
    home = ./frost/home;
  };
  dell = mkNixos {
    modules = [./dell/configuration.nix];
    home = ./dell/home;
  };
  live = mkNixos {
    modules = [
      (inputs.nixpkgs
        + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
      ./iso/configuration.nix
    ];
  };
}
