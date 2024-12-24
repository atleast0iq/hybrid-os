{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-2311.url = "github:NixOS/nixpkgs/nixos-23.11";

    disko.url = "github:nix-community/disko";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    stylix.url = "github:danth/stylix/release-24.11";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    potatofox = {
      url = "git+https://codeberg.org/awwpotato/PotatoFox";
      flake = false;
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    zen-browser.url = "github:fufexan/zen-browser-flake";
  };

  outputs = inputs @ {self, ...}: let
    system = "x86_64-linux";

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-master = import inputs.nixpkgs-master {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-2311 = import inputs.nixpkgs-2311 {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      sviblovo = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit self inputs pkgs pkgs-unstable pkgs-master pkgs-2311;};

        modules = [
          ./disko.nix
          {_module.args.device = "/dev/nvme0n1";}
          ./system

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.verbose = true;
            home-manager.backupFileExtension = "homeManagerBackupFileExtension";
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {inherit self inputs pkgs pkgs-unstable pkgs-master pkgs-2311;};
            home-manager.users.iilyakov.imports = [./home];
          }
        ];
      };
    };

    formatter.${system} = pkgs.alejandra;
  };
}
