{ pkgs-73cf49b, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs-73cf49b.vscodium;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;

    extensions = with pkgs-73cf49b.vscode-extensions; [
      ms-vscode.cpptools
      ms-python.python
      golang.go
      bbenoist.nix
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];

    userSettings = {
      "extensions.autoUpdate" = false;

      "editor.fontFamily" = "SFMono Nerd Font";
      "editor.fontSize" = 14;
      "editor.fontWeight" = 400;
      "editor.fontLigatures" = true;
      "editor.fontVariations" = false;
      "editor.minimap.enabled" = false;
      "editor.hideCursorInOverviewRuler" = true;
      "editor.overviewRulerBorder" = false;
      "editor.scrollbar.horizontal" = "hidden";
      "editor.scrollbar.vertical" = "hidden";

      "workbench.statusBar.visible" = false;
      "workbench.activityBar.location" = "hidden";
      "breadcrumbs.enabled" = false;
      "window.menuBarVisibility" = "toggle";
      "files.autoSave" = "onFocusChange";
      "files.insertFinalNewline" = true;

      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "catppuccin.workbenchMode" = "flat";
      "catppuccin.extraBordersEnabled" = true;
      "catppuccin.colorOverrides" = {
        "all" = {
          "base" = "#000000";
          "mantle" = "#010101";
          "crust" = "#020202";
        };
      };
    };
  };
}
