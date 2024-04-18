{ config, lib, pkgs, inputs, ... }: {
  # import other conifiguration files
  imports = [ 
    ./hardware-configuration.nix
  ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel modules
  boot.initrd.kernelModules = [ "amdgpu" ];

  # networking
  networking = {
    networkmanager.enable = true;
    
    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";

    hostName = "meteora";
  };

  # timezone and locale
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # console setup
  console = {
    earlySetup = true;
    packages = with pkgs; [ terminus_font ];
    font = "ter-v24n";
    keyMap = "us";
  };

  # services
  services.openssh.enable = true;

  # add users
  users.users = {
    iilyakov = {
      isNormalUser = true;
      description = "Ivan Ilyakov";
      extraGroups = [ "networkmanager" "wheel" ];
      createHome = true;
      home = "/home/iilyakov";
    };
  };

  # setup nix and nixpkgs
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

  nixpkgs = {
    config.allowUnfree = true;
  };

  system.stateVersion = "23.11";
}
