{ config, pkgs, lib, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # tools to build my config
    neovim
    git
    just
  ];
}
