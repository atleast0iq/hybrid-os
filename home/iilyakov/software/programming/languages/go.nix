{pkgs, ...}: {
  programs.go = {
    enable = true;
    goPath = "go";
    package = pkgs.go;
  };

  home.packages = with pkgs; [
    delve
    gopls
  ];
}
