{pkgs, ...}: {
  home.packages = with pkgs; [
    clang-tools
    gcc
    cmake
    gdb
    lldb
  ];
}
