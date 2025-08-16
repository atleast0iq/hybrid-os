{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    clang-tools
    gcc
    cmake
    gdb
    lldb
  ];
}
