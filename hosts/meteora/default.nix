{ config, lib, pkgs, inputs, ... }: {
 imports = [ 
    ./../hardware-configuration.nix
    ./packages.nix
    ./services.nix
    ./users.nix
  ];

  # boot
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
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

    initrd.kernelModules = [ "amdgpu" ];

    # silent boot
    initrd.verbose = false;
    kernelParams = [ "quiet" "udev.log_level=3" ];
  };

  # hardware
  hardware = {
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    opengl.enable = true;
    opengl.driSupport = true;

    amdgpu.initrd.enable = true;
  };

  # nix
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    
    settings = {
      auto-optimise-store = true;

      substituters = [
        "https://hyprland.cachix.org"  
      ];

      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGC="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # networking
  networking = {
    networkmanager.enable = true;

    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";

    hostName = "meteora";
  };

  # time and locale
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_GB.UTF-8";

  # misc
  console = {
    earlySetup = true;
    packages = with pkgs; [ terminus_font ];
    font = "ter-v24n";
    keyMap = "us";
  };

  environment.variables = {
    EDITOR = "nvim";
  };

  # NixOS version
  system.stateVersion = "24.05";
}
