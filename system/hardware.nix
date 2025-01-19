{
  pkgs-stable,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  hardware = {
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    amdgpu.initrd.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    sane = {
      enable = true;
      extraBackends = with pkgs-stable; [hplipWithPlugin epkowa];
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs-stable; [
      gutenprintBin
      canon-cups-ufr2
      canon-capt
      hplip
    ];
  };
}
