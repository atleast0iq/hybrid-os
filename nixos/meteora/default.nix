{
  self,
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  sysmod = "${self}/modules/system";
in {
  imports = [
    "${sysmod}/hardware/bluetooth.nix"
    "${sysmod}/hardware/fwupd.nix"
    "${sysmod}/hardware/graphics.nix"
    "${sysmod}/hardware/printing.nix"
    "${sysmod}/hardware/scanners.nix"
    "${sysmod}/packages/fonts.nix"
    "${sysmod}/packages/programs.nix"
    "${sysmod}/services/amnezia-vpn.nix"
    "${sysmod}/services/docker.nix"
    "${sysmod}/services/gnome.nix"
    "${sysmod}/services/pipewire.nix"
    "${sysmod}/networking.nix"
    "${sysmod}/nix.nix"
    "${sysmod}/security.nix"
    "${sysmod}/steam.nix"

    ./hardware-configuration.nix
    ./users.nix

    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  networking.hostName = "meteora";
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
  environment.systemPackages = [pkgs.sbctl];

  boot = {
    # loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    plymouth.enable = true;

    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    kernelModules = ["amdgpu" "v4l2loopback" "ideapad_laptop"];
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
    };
    kernelParams = [
      "quiet"
      "loglevel=3"
      "splash"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
  };

  hardware.cpu.amd.updateMicrocode = true;

  system.stateVersion = "25.05";
}
