{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-dc460ec.url = "github:NixOS/nixpkgs/dc460ec76cbff0e66e269457d7b728432263166c";
    nixpkgs-2311.url = "github:NixOS/nixpkgs/nixos-23.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    potatofox = {
      url = "git+https://codeberg.org/awwpotato/PotatoFox";
      flake = false;
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-dc460ec,
      nixpkgs-2311,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-dc460ec = import nixpkgs-dc460ec {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-2311 = import nixpkgs-2311 {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        sviblovo = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              self
              inputs
              pkgs
              pkgs-dc460ec
              pkgs-2311
              ;
          };

          modules = [
            ./disko.nix
            { _module.args.device = "/dev/nvme0n1"; }
            ./nixos/sviblovo

            home-manager.nixosModules.home-manager
            {
              home-manager.verbose = true;
              home-manager.backupFileExtension = "homeManagerBackupFileExtension";
              home-manager.useGlobalPkgs = true;
              home-manager.extraSpecialArgs = {
                inherit
                  self
                  inputs
                  pkgs
                  pkgs-dc460ec
                  pkgs-2311
                  ;
              };
              home-manager.users.iilyakov.imports = [ ./home/iilyakov ];
            }
          ];
        };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
