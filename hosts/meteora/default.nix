{ config, lib, pkgs, inputs, ... }: {
  imports = [ 
    ./hardware-configuration.nix # some hardware stuff

    ./nix.nix # nix and nixpkgs configurations
    ./boot.nix # bootloader options
  ];

  # networking
  networking = {
    networkmanager.enable = true;
    
    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";

    hostName = "meteora";
  };
  
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

  # timezone and locale
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_GB.UTF-8";

  # console setup
  console = {
    earlySetup = true;
    packages = with pkgs; [ terminus_font ];
    font = "ter-v24n";
    keyMap = "us";
  };

  # global packages and variables
  environment.systemPackages = with pkgs; [
    git
    just
    vim
    wget
    curl
  ];

  environment.variables = {
    
  };

  # services
  services.openssh.enable = true;

  # system version
  system.stateVersion = "23.11";
}
