{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    ripgrep
    fd
    cpufetch
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
  ];

  programs = {
    bat.enable = true;
  };
}
