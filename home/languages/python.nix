{pkgs, ...}: {
  home.packages = with pkgs.python312Packages; [
    python
    pip
    tkinter
    virtualenv
  ];
}
