{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.greetd =
    let
      tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
      session = "Hyprland";
    in
    {
      enable = true;
      settings.default_session = {
        command = "${tuigreet} --time --remember --cmd ${session}";
        user = "greeter";
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
