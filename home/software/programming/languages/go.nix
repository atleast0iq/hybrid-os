{ pkgs-unstable, ... }:
{
  programs.go = {
    enable = true;
    goPath = "go";
    package = pkgs-unstable.go;
  };

  home.packages = with pkgs-unstable; [
    delve
  ];
}
