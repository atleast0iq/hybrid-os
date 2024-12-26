{
  config,
  pkgs,
  pkgs-unstable,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelPackages = pkgs-unstable.linuxPackages_6_6;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback pkgs-unstable.linuxPackages_6_6.amneziawg];
    kernelModules = [
      "v4l2loopback"
      "kvm-amd"
    ];

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
      ];
      kernelModules = [
        "nvme"
        "xhci_pci"
        "amdgpu"
      ];
    };
  };

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
      extraBackends = with pkgs; [hplipWithPlugin epkowa];
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
    drivers = with pkgs; [
      gutenprintBin
      canon-cups-ufr2
      canon-capt
      hplip
    ];
  };
}
