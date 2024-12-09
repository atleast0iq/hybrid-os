{pkgs, ...}: {
  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    hyprspace
  ];

  wayland.windowManager.hyprland.settings.plugin = {
    overview = {
      panelHeight = 150;
      panelBorderWidth = 2;
      onBottom = false;
      workspaceMargin = 10;
      reservedArea = 0;
      workspaceBorderSize = 1;
      centerAligned = true;
      hideBackgroundLayers = false;
      hideTopLayers = false;
      hideOverlayLayers = false;
      hideRealLayers = true;
      drawActiveWorkspace = true;
      overrideGaps = true;
      gapsIn = 10;
      gapsOut = 20;
      affectStrut = true;
    };
  };
}
