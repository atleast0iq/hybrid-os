{
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        ms-vscode.cpptools
        ms-python.python
        golang.go
        bbenoist.nix
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
      ];

      userSettings = {
        "extensions.autoUpdate" = false;

        "editor.fontFamily" = lib.mkForce "SFMono Nerd Font";
        "editor.fontSize" = lib.mkForce 14;
        "terminal.integrated.fontSize" = lib.mkForce 14;
        "debug.console.fontSize" = lib.mkForce 14;
        "markdown.preview.fontSize" = lib.mkForce 14;
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
        "workbench.sideBar.location" = "right";
        "breadcrumbs.enabled" = false;
        "window.menuBarVisibility" = "toggle";
        "window.customTitleBarVisibility" = "never";
        "window.titleBarStyle" = "native";
        "files.autoSave" = "onFocusChange";
        "files.insertFinalNewline" = true;

        "workbench.iconTheme" = "catppuccin-mocha";
      };
    };
  };
}
