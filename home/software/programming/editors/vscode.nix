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
      extensions.autoCheckUpdates = false;
      update.mode = "none";
      files.autoSave = "onFocusChange";

      editor = {
        fontFamily = "JetBrainsMono Nerd Font";
        fontSize = 14;
        fontWeight = 400;
        fontLigatures = true;
        fontVariations = false;
        minimap.enabled = false;
        hideCursorInOverviewRuler = true;
        overviewRulerBorder = false;
        scrollbar.horizontal = "hidden";
        scrollbar.vertical = "hidden";
      };

      workbench = {
        iconTheme = "vscode-icons";
        colorTheme = "Ayu Mirage Bordered";
        statusBar.visible = false;
        activityBar.visible = false;
      };

      breadcrumbs.enabled = false;

      window = {
        menuBarVisibility = "toggle";
        zoomLevel = 1;
      };
    };
  };
}
