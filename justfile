default:
    @just --list

home-manager-build:
    nix build path:.#homeManagerConfigurations.iilyakov.activationPackage

home-manager-build-verbose:
    nix build path:.#homeManagerConfigurations.iilyakov.activationPackage --show-trace

home-manager-switch: home-manager-build
    ./result/activate

switch-system:
    sudo nixos-rebuild switch --flake path:.#meteora

copy-hardware-config:
    cp /etc/nixos/hardware-configuration.nix ./hosts/hardware-configuration.nix

update-flake:
    sudo nix flake update

update-dotfiles:
    git add .
    git commit -m "Updated dotfiles"
    git push origin main

garbage-collect:
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d
    sudo nix store gc --debug
    home-manager expire-generations "-7 days"
