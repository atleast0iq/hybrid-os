{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-2311.url = "github:NixOS/nixpkgs/nixos-23.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
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

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-2311,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-2311 = import nixpkgs-2311 {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      sviblovo = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit self inputs pkgs pkgs-2311;};

        modules = [
          ./disko.nix
          {_module.args.device = "/dev/nvme0n1";}
          ./nixos/sviblovo

          home-manager.nixosModules.home-manager
          {
            home-manager.verbose = true;
            home-manager.backupFileExtension = "homeManagerBackupFileExtension";
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {inherit self inputs pkgs pkgs-2311;};
            home-manager.users.iilyakov.imports = [./home/iilyakov];
          }
        ];
      };
    };

    formatter.${system} = pkgs.alejandra;
  };
}
