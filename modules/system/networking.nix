{pkgs, ...}: {
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.powersave = true;
  };

  services.resolved.enable = true;
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
