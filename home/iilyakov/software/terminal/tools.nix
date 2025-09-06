{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    ripgrep
    fd
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
    wev
    unzip
    eza
    jq
    libqalculate
    libnotify
    yt-dlp
  ];

  programs = {
    bat.enable = true;
  };
}
