{ config, pkgs, lib, inputs, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
  boot.initrd.kernelModules = [ "amdgpu" ];
}
