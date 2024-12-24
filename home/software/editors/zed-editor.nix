{pkgs-master, ...}: {
  programs.zed-editor = {
    enable = true;
    package = pkgs-master.zed-editor;
    extensions = [
      "nix"
      "just"
    ];
    userKeymaps = {};
    userSettings = {
      auto_update = false;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      theme = "Ayu Mirage";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 16;
      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 16;

      autosave = "on_focus_change";

      languages = {
        Nix = {
          tab_size = 2;
          formatter = {
            external = {
              command = "alejandra";
            };
          };
        };
      };
      lsp = {
        clangd = {
          binary = {
            path = "clangd";
            arguments = [
              "-header-insertion=never"
            ];
          };
        };
      };
    };
  };
}
