default:
    @just --list

switch-system:
    find ~ -type f -name "*.homeManagerBackupFileExtension" -delete
    sudo nixos-rebuild switch --flake path:.#sviblovo

update-flake:
    nix flake update

update-dotfiles:
    git add .
    git commit -m "Updated dotfiles"
    git push origin main

gc:
    sudo nix-collect-garbage --delete-old

install: switch-system
