{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    polarity = "dark";
    image = ./../unmanaged/images/backgrounds/moscow.png;
    base16Scheme = {
      base00 = "000000"; # base
      base01 = "000000"; # mantle
      base02 = "313244"; # surface0
      base03 = "45475a"; # surface1
      base04 = "585b70"; # surface2
      base05 = "cdd6f4"; # text
      base06 = "f5e0dc"; # rosewater
      base07 = "b4befe"; # lavender
      base08 = "f38ba8"; # red
      base09 = "fab387"; # peach
      base0A = "f9e2af"; # yellow
      base0B = "a6e3a1"; # green
      base0C = "94e2d5"; # teal
      base0D = "89b4fa"; # blue
      base0E = "cba6f7"; # mauve
      base0F = "f2cdcd"; # flamingo
    };

    cursor = {
      name = "WhiteSur-cursors";
      package = pkgs.whitesur-cursors;
      size = 22;
    };

    iconTheme = {
      enable = true;
      package = pkgs.whitesur-icon-theme.override {
        alternativeIcons = true;
        boldPanelIcons = true;
      };
      dark = "WhiteSur-dark";
      light = "WhiteSur-light";
    };

    fonts = rec {
      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      sansSerif = serif;
      monospace = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-mono-nerd;
        name = "SFMono Nerd Font";
      };
      sizes.applications = 15;
      sizes.terminal = 15;
    };

    opacity.terminal = 0.8;

    targets = {
      hyprlock.enable = false;
      rofi.enable = false;
      spicetify.enable = false;
    };
  };

  gtk = {
    enable = true;
  };
}
