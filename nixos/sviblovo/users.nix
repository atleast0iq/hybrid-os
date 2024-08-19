{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  environment.shells = with pkgs; [fish];
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  users = {
    users.iilyakov = {
      isNormalUser = true;
      description = "Ivan Ilyakov";
      extraGroups = ["networkmanager" "wheel" "input" "docker" "adbusers"];
      createHome = true;
      home = "/home/iilyakov";
      shell = pkgs.fish;
    };
  };
}
