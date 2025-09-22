{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./colorschemes.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
  };
}
