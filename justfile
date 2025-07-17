default:
    @just --list

switch-system:
    sudo nixos-rebuild switch --flake path:.#pavshino --option

update-flake:
    nix flake update

fmt:
    nix fmt .

update-dotfiles: fmt
    git add .
    git commit -m "Updated dotfiles"
    git push origin main

gc:
    sudo nix-collect-garbage --delete-old

install: switch-system
