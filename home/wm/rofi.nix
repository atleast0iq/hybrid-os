{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "foot";

    extraConfig = {
      modi = "drun";
      show-icons = true;
      font = "JetBrainsMono Nerd Font Mono 12";
      drun-display-format = "{icon} {name}";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg = lib.mkForce (mkLiteral "#${config.lib.stylix.colors.base00}e6");
        selected = lib.mkForce (mkLiteral "#${config.lib.stylix.colors.base0D}");
        active = lib.mkForce (mkLiteral "#${config.lib.stylix.colors.base0D}");
        text-selected = lib.mkForce (mkLiteral "#${config.lib.stylix.colors.base00}");
        text-color = lib.mkForce (mkLiteral "#${config.lib.stylix.colors.base05}");
        border-color = lib.mkForce (mkLiteral "#${config.lib.stylix.colors.base0D}");
      };
      "window" = {
        width = mkLiteral "672px";
        transparency = "real";
        orientation = mkLiteral "vertical";
        cursor = mkLiteral "default";
        spacing = mkLiteral "0px";
        border = mkLiteral "1px";
        border-color = "@border-color";
        border-radius = mkLiteral "9px";
        background-color = lib.mkForce (mkLiteral "@bg");
      };
      "mainbox" = {
        padding = mkLiteral "15px";
        enabled = true;
        orientation = mkLiteral "vertical";
        children = map mkLiteral [
          "inputbar"
          "listbox"
        ];
        background-color = lib.mkForce (mkLiteral "transparent");
      };
      "inputbar" = {
        enabled = true;
        margin = mkLiteral "10px";
        background-color = lib.mkForce (mkLiteral "transparent");
        border-radius = "9px";
        orientation = mkLiteral "horizontal";
        children = map mkLiteral ["entry"];
      };
      "entry" = {
        enabled = true;
        expand = false;
        width = mkLiteral "100%";
        padding = mkLiteral "10px";
        border-radius = mkLiteral "9px";
        background-color = lib.mkForce (mkLiteral "transparent");
        text-color = lib.mkForce (mkLiteral "@text-color");
        cursor = mkLiteral "text";
        placeholder = "🖥️Search ";
        placeholder-color = mkLiteral "inherit";
      };
      "listbox" = {
        spacing = mkLiteral "10px";
        padding = mkLiteral "10px";
        background-color = lib.mkForce (mkLiteral "transparent");
        orientation = mkLiteral "vertical";
        children = map mkLiteral ["listview"];
      };
      "listview" = {
        enabled = true;
        columns = 2;
        lines = 5;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        spacing = mkLiteral "10px";
        background-color = lib.mkForce (mkLiteral "transparent");
        border = mkLiteral "0px";
      };
      "element" = {
        enabled = true;
        spacing = mkLiteral "10px";
        padding = mkLiteral "10px";
        border-radius = mkLiteral "9px";
        background-color = lib.mkForce (mkLiteral "transparent");
        cursor = mkLiteral "pointer";
      };
      "element normal.normal" = {
        background-color = lib.mkForce (mkLiteral "inherit");
        text-color = lib.mkForce (mkLiteral "inherit");
      };
      "element selected.normal" = {
        background-color = lib.mkForce (mkLiteral "@selected");
        text-color = lib.mkForce (mkLiteral "@text-selected");
      };
      "element alternate.normal" = {
        background-color = lib.mkForce (mkLiteral "transparent");
        text-color = lib.mkForce (mkLiteral "inherit");
      };
      "element-icon" = {
        background-color = lib.mkForce (mkLiteral "transparent");
        text-color = lib.mkForce (mkLiteral "inherit");
        size = mkLiteral "36px";
        cursor = mkLiteral "inherit";
      };
      "element-text" = {
        background-color = lib.mkForce (mkLiteral "transparent");
        font = "JetBrainsMono Nerd Font Mono 12";
        text-color = lib.mkForce (mkLiteral "inherit");
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };
    };
  };
}
