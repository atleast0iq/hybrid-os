{
  lib,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = lib.mkDefault true;
    xwayland.enable = true;
  };

  services = {
    blueman.enable = lib.mkDefault true;

    greetd = let
      tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
      session = "Hyprland";
    in {
      enable = lib.mkDefault true;
      settings.default_session = {
        command = "${tuigreet} --time --remember --cmd ${session}";
        user = "greeter";
      };
    };

    tlp = {
      enable = lib.mkDefault true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
