{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # ./firefox.nix
  ];

  home.packages = with pkgs; [
    chromium
    inputs.zen-browser.packages."${system}".default
  ];
}
