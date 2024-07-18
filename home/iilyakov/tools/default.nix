{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    cpufetch
    fastfetch
    wget
    curl
    btop
    brightnessctl
    pulsemixer
    acpi
    killall
    grim
    slurp
    wl-clipboard
  ];
}
