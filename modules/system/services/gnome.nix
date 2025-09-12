{pkgs, ...}: {
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-maps
    gnome-contacts
    gnome-weather
    gnome-music
    gnome-notes
    gnome-logs
    gnome-music
    gnome-characters
    gnome-calendar
    gnome-connections
    gnome-text-editor
    seahorse
    epiphany
    geary
    yelp
  ];
}
