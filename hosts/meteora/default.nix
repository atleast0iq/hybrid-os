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
      };

      grub2-theme = {
        enable = true;
        theme = "vimix";
        footer = true;
      };
    };

    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
    initrd.kernelModules = [ "amdgpu" ];

    plymouth = {
      enable = true;
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
