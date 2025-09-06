{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = lib.mkForce {
      mainBar = {
        "height" = 32;

        "margin-left" = 20;
        "margin-right" = 20;
        "margin-top" = 7;

        "modules-left" = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        "modules-center" = ["clock"];
        "modules-right" = [
          "tray"
          "hyprland/language"
          "network"
          "backlight"
          "pulseaudio"
          "battery"
        ];

        "hyprland/workspaces" = {
          "persistent-workspaces" = {
            "eDP-1" = [
              1
              2
              3
              4
              5
              6
            ];
            "HDMI-A-1" = [
              11
              12
              13
              14
              15
              16
            ];
          };
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
          "tooltip" = true;
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#${config.lib.stylix.colors.base0A}'><b>{}</b></span>";
              "weekdays" = "<span color='#${config.lib.stylix.colors.base04}'><b>{}</b></span>";
              "today" = "<span color='#${config.lib.stylix.colors.base08}'><b>{}</b></span>";
            };
          };
        };

        "tray" = {
          "icon-size" = 18;
          "spacing" = 20;
          "reverse-direction" = true;
        };

        "hyprland/language" = {
          "format-en" = "🇺🇸 en";
          "format-ru" = "🇷🇺 ru";
        };

        "network" = {
          "format" = "󰤨  {essid}";
          "format-disconnected" = "󰤭  disconnected";
          "format-ethernet" = "󰤨  wired";
          "tooltip" = false;
        };

        "backlight" = {
          "format" = "{icon}  {percent}%";
          "format-icons" = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          "tooltip" = false;
        };

        "pulseaudio" = {
          "format" = "{format_source} {icon} {volume}%";
          "format-muted" = "{format_source}  muted";
          "format-icons" = [
            ""
            ""
            ""
          ];
          "format-source" = "󰍬";
          "format-source-muted" = "󰍭";
          "tooltip" = false;
        };

        "battery" = {
          "interval" = 60;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-icons" = [
            "󰂎"
            "󱊡"
            "󱊢"
            "󱊣"
          ];
          "format-charging" = "󰂄 {capacity}%";
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

      tooltip {
          background: #${config.lib.stylix.colors.base00};
          color: #${config.lib.stylix.colors.base05};
          font-size: 13pt;
          border-radius: 9px;
          border: 0px solid;
          opacity: 0.9;
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

      #tray,
      #language,
      #network,
      #backlight,
      #pulseaudio,
      #battery {
          padding-right: 20px;
      }

      #network {
        color: #${config.lib.stylix.colors.base0C};
      }

      #backlight {
        color: #${config.lib.stylix.colors.base0A};
      }

      #pulseaudio {
        color: #${config.lib.stylix.colors.base0E};
      }

      #battery.critical:not(.charging) {
        color: #${config.lib.stylix.colors.base08};
      }

      #battery:not(.critical) {
        color: #${config.lib.stylix.colors.base0B};
      }
    '';
  };
}
