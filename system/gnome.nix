{ pkgs, ... }:
{
  programs.hyprland.enable = false;

  services = {
    blueman.enable = false;
    greetd.enable = false;
    tlp.enable = false;
  };

  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    adwaita-icon-theme
  ];
  services.udev.packages = [ pkgs.gnome-settings-daemon ];

  environment.gnome.excludePackages = with pkgs; [
    geary
    gedit
    gnome-connections
    gnome-tour
    snapshot
    atomix
    baobab
    epiphany
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-secrets
    gnome-shell-extensions
    hitori
    iagno
    tali
    yelp
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    excludePackages = with pkgs; [ xterm ];
  };
}
