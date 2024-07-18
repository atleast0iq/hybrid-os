default:
    @just --list

copy-hardware-config:
    cp /etc/nixos/hardware-configuration.nix ./nixos/sviblovo/hardware-configuration.nix

switch-system:
    find ~ -type f -name "*.homeManagerBackupFileExtension" -delete
    sudo nixos-rebuild switch --flake path:.#sviblovo

update-flake:
    sudo nix flake update

update-dotfiles:
    git add .
    git commit -m "Updated dotfiles"
    git push origin main

gc:
    nix-collect-garbage --delete-old

install: copy-hardware-config switch-system
    