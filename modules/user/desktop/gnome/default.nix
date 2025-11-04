{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.dash-to-dock
    gnomeExtensions.search-light
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.bluetooth-battery
    gnomeExtensions.battery-health-charging
  ];
}
