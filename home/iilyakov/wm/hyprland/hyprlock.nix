{ self, ... }:
{
  programs.hyprlock.enable = true;
  programs.hyprlock.extraConfig = ''
    # BACKGROUND
    background {
        monitor =
        path = ${self}/home/iilyakov/images/fish.webp
        blur_passes = 2
        contrast = 0.8916
        brightness = 0.6872
        vibrancy = 0.1696
        vibrancy_darkness = 0.2
    }

    # GENERAL
    general {
        no_fade_in = false
        grace = 0
        disable_loading_bar = false
    }


    # Day
    label {
        monitor =
        text = cmd[update:1000] echo -e "$(date +"%A")"
        color = rgba(216, 222, 233, 0.70)
        font_size = 90
        font_family = Rubik Mono One
        position = 0, 350
        halign = center
        valign = center
    }

    # Date-Month
    label {
        monitor =
        text = cmd[update:1000] echo -e "$(date +"%d %B")"
        color = rgba(216, 222, 233, 0.70)
        font_size = 40
        font_family = Rubik Mono One
        position = 0, 250
        halign = center
        valign = center
    }

    # Time
    label {
        monitor =
        text = cmd[update:1000] echo "<span>$(date +"%H:%M")</span>"
        color = rgba(216, 222, 233, 0.70)
        font_size = 20
        font_family = Rubik Mono One
        position = 0, 190
        halign = center
        valign = center
    }

    # Profie-Photo
    image {
        monitor =
        path = ${self}/home/iilyakov/images/iilyakov.jpg
        border_size = 2
        border_color = rgba(255, 255, 255, .65)
        size = 130
        rounding = -1
        rotate = 0
        reload_time = -1
        reload_cmd =
        position = 0, 40
        halign = center
        valign = center
    }

    # USER-BOX
    shape {
        monitor =
        size = 300, 60
        color = rgba(255, 255, 255, .1)
        rounding = -1
        border_size = 0
        border_color = rgba(255, 255, 255, 0)
        rotate = 0
        xray = false # if true, make a "hole" in the background (rectangle of specified size, no rotation)

        position = 0, -130
        halign = center
        valign = center
    }

    # USER
    label {
        monitor =
        text =   $USER
        color = rgba(216, 222, 233, 0.80)
        outline_thickness = 2
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        font_size = 18
        font_family = SpaceMono Nerd Font
        position = 0, -130
        halign = center
        valign = center
        size = 600, 60
    }

    # INPUT FIELD
    input-field {
        monitor =
        size = 300, 60
        outline_thickness = 2
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = rgba(255, 255, 255, 0)
        inner_color = rgba(255, 255, 255, 0.1)
        font_color = rgb(200, 200, 200)
        fade_on_empty = false
        font_family = SpaceMono Nerd Font
        placeholder_text = <span foreground="##ffffff99">🔒 Enter Pass</span>
        hide_input = false
        position = 0, -210
        halign = center
        valign = center
    }
  '';
}
