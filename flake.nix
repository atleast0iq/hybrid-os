{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
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

    ags.url = "github:Aylur/ags";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      sviblovo = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs pkgs pkgs-unstable;};

        modules = [
          inputs.disko.nixosModules.default
          ./disko.nix
          {_module.args.device = "/dev/nvme0n1";}
          ./nixos/sviblovo

          home-manager.nixosModules.home-manager
          {
            home-manager.verbose = true;
            home-manager.backupFileExtension = "homeManagerBackupFileExtension";
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {inherit inputs pkgs pkgs-unstable;};
            home-manager.users.iilyakov.imports = [
              ./home/iilyakov
              inputs.stylix.homeManagerModules.stylix
            ];
          }
        ];
      };
    };

    formatter.${system} = pkgs.nixpkgs-fmt;
  };
}
