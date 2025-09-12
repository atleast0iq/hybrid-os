{pkgs, ...}: {
  home.packages = with pkgs; [
    libclang
    gcc
    cmake
    gdb
    lldb
  ];
}
