{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Ivan Ilyakov";
    userEmail = "karginux@ya.ru";
    extraConfig.init.defaultBranch = "main";
  };
}
