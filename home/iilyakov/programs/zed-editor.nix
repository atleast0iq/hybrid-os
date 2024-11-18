{pkgs-dc460ec, ...}: {
  programs.zed-editor = {
    enable = true;
    package = pkgs-dc460ec.zed-editor;
    extensions = [
      "nix"
      "justfile"
    ];
    userKeymaps = {};
    userSettings = {
      auto_update = false;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      theme = "Ayu Dark";
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
    };
  };
}
