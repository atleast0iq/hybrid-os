{pkgs, ...}: {
  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      hplipWithPlugin
      sane-airscan
    ];
    disabledDefaultBackends = ["escl"];
  };
  services.ipp-usb.enable = true;

  services.udev.packages = [pkgs.sane-airscan];
}
