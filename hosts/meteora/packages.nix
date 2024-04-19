{ config, pkgs, lib, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    just
    wget
    curl
  ];
}
