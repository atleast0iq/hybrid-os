default:
    @just --list

switch-system:
    sudo nixos-rebuild switch --flake path:. --option cores 3

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
