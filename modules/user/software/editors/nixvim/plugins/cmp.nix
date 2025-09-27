{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        mapping = {
          "<C-e>" = "cmp.mapping.close()";

          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";

          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
          {name = "path";}
          {name = "nvim_lsp";}
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }

          {name = "nvim_lsp_signature_help";}
        ];

        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
  };
}
