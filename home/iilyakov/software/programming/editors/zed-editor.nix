{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [
      "nix"
      "just"
    ];
    userKeymaps = [];
    userSettings = {
      auto_update = false;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      buffer_font_family = lib.mkForce "JetBrainsMono Nerd Font";
      buffer_font_size = lib.mkForce 16;
      ui_font_family = lib.mkForce "JetBrainsMono Nerd Font";
      ui_font_size = lib.mkForce 16;

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
