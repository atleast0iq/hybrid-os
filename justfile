default:
    @just --list

home-manager-build:
    nix build path:.#homeManagerConfigurations.iilyakov.activationPackage

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

collect-garbage:
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d
    sudo nix store gc --debug
    home-manager expire-generations "-7 days"

DELETE-OLD-WARNING:
    sudo nix-collect-garbage --delete-older-than 7d
    sudo nix-collect-garbage --delete-old
    just switch-system
