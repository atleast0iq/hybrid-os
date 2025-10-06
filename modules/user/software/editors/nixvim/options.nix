{
  programs.nixvim = {
    luaLoader.enable = true;

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;

      updatetime = 50;

      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;

      swapfile = false;
      backup = false;
      undofile = true;

      mouse = "a";
      mousemodel = "extend";
      splitbelow = true;
      splitright = true;

      wrap = false;
      virtualedit = "block";
      showmode = false;
      completeopt = ["menu" "menuone" "noselect"];
      termguicolors = true;
    };

    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };

    extraConfigLuaPre = ''
      vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticerror", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignwarn", { text = " ", texthl = "diagnosticwarn", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignhint", { text = "󰌵 ", texthl = "diagnostichint", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsigninfo", { text = " ", texthl = "diagnosticinfo", linehl = "", numhl = "" })
    '';

    diagnostic.settings.virtual_text = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
