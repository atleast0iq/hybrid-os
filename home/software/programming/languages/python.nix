{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    python312Full
    python312Packages.pip
    python312Packages.tkinter
    python312Packages.virtualenv
  ];
}
