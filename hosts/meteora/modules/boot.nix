{ config, pkgs, lib, inputs, ... }: {
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "/dev/nvme0n1";
    };
  };

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.plymouth = {
    enable = true;
  };
}
