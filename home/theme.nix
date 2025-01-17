{
  pkgs-stable,
  inputs,
  ...
}: let
  default_font = {
    name = "JetBrainsMono Nerd Font";
    package = pkgs-stable.nerdfonts.override {
      fonts = [
        "JetBrainsMono"
      ];
    };
  };
in {
  imports = [inputs.stylix.homeManagerModules.stylix];

  stylix = {
    enable = true;
    polarity = "dark";
    image = ./../unmanaged/images/metro.jpg;
    base16Scheme = "${pkgs-stable.base16-schemes}/share/themes/ayu-mirage.yaml";

    cursor = {
      package = pkgs-stable.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };

    fonts = {
      monospace = default_font;
      serif = default_font;
      sansSerif = default_font;
      emoji = default_font;
      sizes.applications = 15;
      sizes.terminal = 15;
    };

    opacity.terminal = 0.9;

    targets = {
      hyprlock.enable = false;
      rofi.enable = false;
      spicetify.enable = false;
      vscode.enable = false;
    };
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs-stable.rose-pine-icon-theme;
      name = "rose-pine";
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };
}
