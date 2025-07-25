{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-25.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix/c0876c7";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
  };

  outputs =
    inputs@{ self, ... }:
    let
      system = "x86_64-linux";

      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        pavshino = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              self
              inputs
              pkgs-unstable
              ;
          };

          modules = [
            ./disko.nix
            { _module.args.device = "/dev/nvme0n1"; }
            ./system

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.verbose = true;
              home-manager.backupFileExtension = "homeManagerBackupFileExtension";
              home-manager.extraSpecialArgs = {
                inherit
                  self
                  inputs
                  pkgs
                  pkgs-unstable
                  ;
              };
              home-manager.users.iilyakov.imports = [ ./home ];
            }
          ];
        };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
