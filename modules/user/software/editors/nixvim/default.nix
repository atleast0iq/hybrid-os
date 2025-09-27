{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./mappings.nix
    ./colorschemes.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
