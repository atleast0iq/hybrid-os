{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    rustc
    cargo
    rustfmt
    rust-analyzer
  ];
}
