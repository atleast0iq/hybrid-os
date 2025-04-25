{ pkgs-unstable, ... }:
{
  environment.systemPackages = [ pkgs-unstable.amnezia-vpn ];
  services.dbus.packages = [ pkgs-unstable.amnezia-vpn ];
  services.resolved.enable = true;
  systemd = {
    packages = [ pkgs-unstable.amnezia-vpn ];
    services."AmneziaVPN" = {
      enable = true;
      wantedBy = [ "multi-user.target" ];
      path = with pkgs-unstable; [
        procps
        iproute2
        sudo
      ];
    };
  };
}
