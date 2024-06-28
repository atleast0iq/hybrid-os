{ config, pkgs, lib, inputs, ... }: {
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      forceInstall = true;
    };
  };

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.plymouth = {
    enable = true;
  };
}
