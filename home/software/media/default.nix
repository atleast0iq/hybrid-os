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
  ];

  programs = {
    zathura.enable = true;
  };
}
