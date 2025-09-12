{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.dash-to-dock
  ];
}
