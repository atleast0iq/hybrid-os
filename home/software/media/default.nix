{pkgs, ...}: {
  imports = [
    ./spotify.nix
  ];

  home.packages = with pkgs; [
    qbittorrent
    eog
    vlc
    lmms
    obs-studio
    libreoffice

    # games
    mindustry-wayland
  ];

  programs = {
    zathura.enable = true;
  };
}
