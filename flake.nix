{
  description = "atleast0iq's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-grub-themes.url = "github:atleast0iq/nixos-grub-themes";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixos-grub-themes,
    hyprland,
    ...
  } : let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      meteora = nixpkgs.lib.nixosSystem {
        inherit pkgs system;

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/meteora
        ];
      };
    };

    homeConfigurations = {
      iilyakov = home-manager.lib.homeManagerConfiguration {
        inherit pkgs system;
        extraSpecialArgs = { inherit inputs; };

        modules = [
          ./home/iilyakov
        ];
      };
    };
  };
}
