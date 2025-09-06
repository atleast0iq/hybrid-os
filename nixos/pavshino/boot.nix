{
  config,
  pkgs,
  lib,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_stable;
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
      pkgs.linuxPackages_xanmod_stable.amneziawg
    ];
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

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        forceInstall = true;
        splashImage = lib.mkForce null;

        theme = "${
          (pkgs.fetchFromGitHub {
            owner = "Blaysht";
            repo = "grub_bios_theme";
            rev = "035554c30df6a10158a5a71acfbc4975045fc7ac";
            sha256 = "sha256-kYcEMCV9ipwPGgfAwOtFgYO4eHZxkUS97tOr0ft4rUE=";
          })
        }/OldBIOS/";
      };
    };
  };
}
