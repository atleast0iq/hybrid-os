{...}: {
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.powersave = false;
    hostName = "pavshino";
  };
  services.resolved.enable = true;
}
