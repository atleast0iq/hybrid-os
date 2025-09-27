{
  programs.nixvim = {
    colorschemes = {
      tokyonight.enable = true;
      tokyonight.autoLoad = true;
    };

    highlightOverride = {
      LineNr.fg = "orange";
      CursorLineNr.fg = "white";
    };
  };
}
