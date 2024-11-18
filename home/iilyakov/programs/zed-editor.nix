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
      magnification = 1.15;
      theme = "Ayu Dark";

      autosave = "on_focus_change";
      auto_update = false;

      buffer_font_family = "JetBrainsMono Nerd Font";

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
