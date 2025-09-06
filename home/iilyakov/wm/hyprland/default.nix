{pkgs, ...}: {
  imports = [
    ./autostart.nix
    ./binds.nix
    ./env.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./plugins.nix
    ./rules.nix
    ./settings.nix
    ./xdg-portal.nix
    ./mako.nix
    ./packages.nix
    ./rofi.nix
    ./waybar.nix
  ];
}
