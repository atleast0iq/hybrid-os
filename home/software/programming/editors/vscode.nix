{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      vscode-icons-team.vscode-icons
      ms-vscode.cpptools
      golang.go
      bbenoist.nix
      teabyii.ayu
    ];

    userSettings = {
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontSize" = 14;
      "editor.fontWeight" = 400;
      "editor.fontLigatures" = true;
      "editor.fontVariations" = false;

      "workbench.iconTheme" = "vscode-icons";
      "workbench.colorTheme" = "Ayu Mirage Bordered";
      "workbench.statusBar.visible" = false;
      "workbench.activityBar.visible" = false;
      "editor.minimap.enabled" = false;
      "editor.hideCursorInOverviewRuler" = true;
      "editor.overviewRulerBorder" = false;
      "editor.scrollbar.horizontal" = "hidden";
      "editor.scrollbar.vertical" = "hidden";
      "color-highlight.markRuler" = false;
      "breadcrumbs.enabled" = false;
      "window.menuBarVisibility" = "toggle";
    };
  };
}
