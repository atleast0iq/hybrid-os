{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.11";

    disko.url = "github:nix-community/disko";

    home-manager.url = "github:nix-community/home-manager/master";
    stylix.url = "github:danth/stylix/master";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = inputs @ {self, ...}: let
    system = "x86_64-linux";

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-stable = import inputs.nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      sviblovo = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit self inputs pkgs pkgs-stable;};

        modules = [
          ./disko.nix
          {_module.args.device = "/dev/nvme0n1";}
          ./system

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.verbose = true;
            home-manager.backupFileExtension = "homeManagerBackupFileExtension";
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {inherit self inputs pkgs pkgs-stable;};
            home-manager.users.iilyakov.imports = [./home];
          }
        ];
      };
    };

    formatter.${system} = pkgs.alejandra;
  };
}
