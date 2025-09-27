{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_symbols"
      ];
      popupBorderStyle = "rounded";
      window.mappings = {
        "<space>" = "none";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (root dir)";
        };
      }
    ];
  };
}
