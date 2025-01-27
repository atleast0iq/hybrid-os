{ ... }:
{
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.powersave = false;
    hostName = "sviblovo";
  };
  services.resolved.enable = true;
}
