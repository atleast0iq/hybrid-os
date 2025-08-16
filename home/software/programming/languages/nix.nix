{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    nil
    nixd
  ];
}
