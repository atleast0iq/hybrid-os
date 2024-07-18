{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ./packages
    ./services
  ];

  # boot
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod;
    kernelModules = ["v4l2loopback"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];

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

    initrd.kernelModules = ["amdgpu"];

    # silent boot
    initrd.verbose = false;
    kernelParams = ["quiet" "udev.log_level=3"];
  };

  # hardware
  hardware = {
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    amdgpu.initrd.enable = true;

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = [pkgs.amdvlk];
      extraPackages32 = [pkgs.driversi686Linux.amdvlk];
    };
  };

  # nix
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";

    settings = {
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  # networking
  networking = {
    networkmanager.enable = true;
    networkmanager.wifi.powersave = false;
    enableIPv6 = false;
    useDHCP = false;
    hostName = "meteora";
  };

  # time and locale
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_GB.UTF-8";

  # polkit
  security.polkit.enable = true;

  # sound
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # bluetooth
  hardware.bluetooth.enable = true;

  # misc
  console = {
    earlySetup = true;
    packages = with pkgs; [terminus_font];
    font = "ter-v24n";
    keyMap = "us";
  };

  environment.variables = {
    EDITOR = "nvim";
  };

  # NixOS version
  system.stateVersion = "24.05";
}
