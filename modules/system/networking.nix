{pkgs, ...}: {
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.powersave = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [80 443 22 7777];
    };
  };

  services.resolved.enable = true;
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
