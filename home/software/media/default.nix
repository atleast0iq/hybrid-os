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
    gimp

    # games
    mindustry-wayland
  ];

  programs = {
    zathura.enable = true;
  };
}
