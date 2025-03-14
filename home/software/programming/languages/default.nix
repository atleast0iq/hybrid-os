{ pkgs, ... }:
{
  imports = [
    ./cpp.nix
    ./go.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
  ];

  home.packages = with pkgs; [
    sdl3
    libGL
    libGLU
    glew
    glm
  ];
}
