{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    bitwarden-desktop
    obsidian
    simple-scan
    qbittorrent
    eog
    vlc
    lmms
    obs-studio
    libreoffice
    gimp
    bottles
    telegram-desktop
    vesktop
    video-downloader
    amnezia-vpn
  ];

  programs = {
    zathura = {
      enable = true;
      options.selection-clipboard = "clipboard";
    };
  };
}
