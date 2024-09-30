{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  console = {
    earlySetup = true;
    packages = with pkgs; [terminus_font];
    font = "ter-v24n";
    keyMap = "us";
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
}
