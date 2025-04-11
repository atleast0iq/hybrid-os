{ lib, ... }:
{
  services.mako = {
    enable = true;
    borderRadius = 9;
    defaultTimeout = 3000;
    margin = "7,20";
    font = lib.mkForce "JetBrainsMono Nerd Font";
  };
}
