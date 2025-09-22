{
  outputs = {self, ...} @ inputs: let
    system = "x86_64-linux";

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    specialArgs = {inherit self inputs unstable;};
    extraSpecialArgs = {inherit self inputs pkgs unstable;};
  in {
    nixosConfigurations = {
      meteora = inputs.nixpkgs.lib.nixosSystem {
        inherit system specialArgs;

        modules = [
          ./nixos/meteora
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.verbose = true;
            home-manager.backupFileExtension = "homeManagerBackupFileExtension";
            home-manager.extraSpecialArgs = extraSpecialArgs;
            home-manager.users.atleast0iq.imports = [./home/atleast0iq];
          }
        ];
      };
    };

    devShells = {
      default = pkgs.mkShell {
        packages = [pkgs.alejandra pkgs.git];
        name = "nixland";
        DIRENV_LOG_FORMAT = "";
      };
    };

    formatter.${system} = pkgs.alejandra;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.2";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-25.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org/"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
