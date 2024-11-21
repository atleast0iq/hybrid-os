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
    kernelPackages = pkgs.linuxPackages_xanmod_stable;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback pkgs-unstable.linuxKernel.packages.linux_xanmod_stable.amneziawg];
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
      extraPackages = [pkgs.amdvlk];
      extraPackages32 = [pkgs.driversi686Linux.amdvlk];
    };

    bluetooth.enable = true;
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
