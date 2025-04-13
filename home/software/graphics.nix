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
      transmission_4-gtk
      loupe
      totem
      obs-studio
      libreoffice
      gimp
      xournalpp
      bottles
    ])
    ++ (with pkgs-unstable; [
      telegram-desktop
      vesktop
      amnezia-vpn
    ]);
}
