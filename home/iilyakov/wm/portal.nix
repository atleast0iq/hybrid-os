{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    dconf
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["hyprland" "gtk"];
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };
}
