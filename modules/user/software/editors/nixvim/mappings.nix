{
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        key = "<C-S-Up>";
        action = ":resize -2<CR>";
      }
      {
        mode = "n";
        key = "<C-S-Down>";
        action = ":resize +2<CR>";
      }
      {
        mode = "n";
        key = "<C-S-Left>";
        action = ":vertical resize -2<CR>";
      }
      {
        mode = "n";
        key = "<C-S-Right>";
        action = ":vertical resize +2<CR>";
      }
    ];
  };
}
