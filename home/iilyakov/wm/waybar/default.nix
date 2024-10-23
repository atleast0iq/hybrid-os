{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.waybar = {
    enable = true;

    settings = lib.mkForce {
      mainBar = {
        "output" = "eDP-1";
        "height" = 32;

        "margin-left" = 20;
        "margin-right" = 20;
        "margin-top" = 10;

        "modules-left" = ["hyprland/workspaces" "hyprland/window"];
        "modules-center" = ["clock"];
        "modules-right" = [
          "hyprland/language"
          "network"
          "backlight"
          "wireplumber"
          "battery"
        ];

        "hyprland/workspaces" = {
          "persistent-workspaces" = {"*" = 5;};
        };

        "hyprland/window" = {
          "format" = "{}";
          "rewrite" = {
            "(.*) — Mozilla Firefox" = "🌎 $1";
            "(.*) - fish" = "> [$1]";
          };
          "separate-outputs" = true;
          "max-length" = 40;
        };

        "clock" = {
          "tooltip" = false;
        };

        "hyprland/language" = {
          "format-en" = "🇺🇸 en";
          "format-ru" = "🇷🇺 ru";
        };

        "network" = {
          "format" = "󰤨  {essid}";
          "format-disconnected" = "󰤭  disconnected";
          "tooltip" = false;
        };

        "backlight" = {
          "format" = "{icon}  {percent}%";
          "format-icons" = ["󰃞" "󰃟" "󰃠"];
        };

        "wireplumber" = {
          "format" = "{icon}  {volume}%";
          "format-muted" = " muted";
          "format-icons" = ["" "" ""];
        };

        "battery" = {
          "interval" = 60;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}  {capacity}%";
          "format-icons" = ["" "" "" "" ""];
        };
      };
    };

    style = lib.mkForce ''
      * {
          border: none;
          border-radius: 9px;
          font-family: UbuntuMono Nerd Font;
          font-size: 13pt;
          font-weight: 400;
      }

      window#waybar {
          background: #${config.lib.stylix.colors.base00};
          color: #${config.lib.stylix.colors.base05};
          opacity: 0.9;
      }

      #workspaces {
          margin-left: 10px;
          margin-right: 10px;
      }

      #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: #${config.lib.stylix.colors.base05};
      }

      #workspaces button.active {
          color: #${config.lib.stylix.colors.base0D};
      }

      #language,
      #network,
      #backlight,
      #wireplumber,
      #battery {
          padding-right: 20px;
      }
    '';
  };
}
