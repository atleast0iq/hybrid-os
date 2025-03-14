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
    sdl3.dev
    libGL
    libGLU
    glew
    glm
  ];
}
