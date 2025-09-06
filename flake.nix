{
  outputs = {self, ...} @ inputs: let
    system = "x86_64-linux";
    specialArgs = {inherit self inputs;};

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    extraSpecialArgs = {inherit self inputs pkgs;};
  in {
    nixosConfigurations.pavshino = inputs.nixpkgs.lib.nixosSystem {
      inherit system specialArgs;

      modules = [
        ./nixos/pavshino
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.verbose = true;
          home-manager.backupFileExtension = "homeManagerBackupFileExtension";
          home-manager.extraSpecialArgs = extraSpecialArgs;
          home-manager.users.iilyakov.imports = [./home/iilyakov];
        }
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix/c0876c7";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
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
