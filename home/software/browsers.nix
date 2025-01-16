{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    chromium
    inputs.zen-browser.packages."${system}".default
  ];
}
