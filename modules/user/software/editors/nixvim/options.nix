{
  programs.nixvim = {
    diagnostic.settings.virtual_text = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      showmode = false;

      swapfile = false;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;

      wrap = false;

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
  };
}
