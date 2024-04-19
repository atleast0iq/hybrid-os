default:
    @just --list

copy-hardware-config:
    cp /etc/nixos/hardware-configuration.nix ./hosts/hardware-configuration.nix

update-dotfiles:
    git add .
    git commit -m "Updated dotfiles"
    git push origin main
