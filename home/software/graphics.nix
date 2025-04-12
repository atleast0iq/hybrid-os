{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages =
    (with pkgs; [
      nautilus
      bitwarden-desktop
      simple-scan
      qbittorrent
      eog
      vlc
      obs-studio
      libreoffice
      gimp
      xournalpp
      bottles
    ])
    ++ (with pkgs-unstable; [
      telegram-desktop
      vesktop
      video-downloader
      amnezia-vpn
    ]);

  programs = {
    zathura = {
      enable = true;
      options.selection-clipboard = "clipboard";
    };
  };
}
