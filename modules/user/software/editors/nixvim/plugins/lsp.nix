{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        clangd.enable = true;
        gopls.enable = true;
        nixd.enable = true;
      };
    };
  };
}
