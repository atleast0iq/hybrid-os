default:
    @just --list

home-manager-build:
    nix build path:.#homeManagerConfigurations.iilyakov.activationPackage

home-manager-build-verbose:
    nix build path:.#homeManagerConfigurations.iilyakov.activationPackage --show trace

home-manager-switch: home-manager-build
    ./result/activate

switch-system:
    sudo nixos-rebuild switch --flake path:.#meteora

update-flake:
    nix flake update

copy-hardware-config:
    cp /etc/nixos/hardware-configuration.nix ./hosts/hardware-configuration.nix

update-dotfiles:
    git add .
    git commit -m "Updated dotfiles"
    git push origin main
