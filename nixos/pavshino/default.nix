{...}: {
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./hardware.nix
    ./hyprland.nix
    ./locale.nix
    ./misc.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./services.nix
    ./steam.nix
    ./users.nix
  ];

  system.stateVersion = "24.05";
}
