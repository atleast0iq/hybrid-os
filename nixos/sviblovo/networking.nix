{ ... }:
{
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.powersave = false;
    hostName = "sviblovo";

    firewall = {
      enable = true;
      allowedUDPPorts = [ 51820 ];
      allowedTCPPorts = [ 22 ];
    };
  };
  services.resolved.enable = true;

  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_GB.UTF-8";
}
