{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    stylix.url = "github:danth/stylix/release-24.11";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix/38f2062e9d3520dd850fe84fc38840d994467443";
    zen-browser.url = "github:youwen5/zen-browser-flake/5a697becc1cdcbc8943d9ee6023dfa5922214a5d";
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
        sviblovo = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              self
              inputs
              pkgs
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
              home-manager.useGlobalPkgs = true;
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
