{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    chromium
    inputs.zen-twilight.packages."${system}".default
  ];
}
