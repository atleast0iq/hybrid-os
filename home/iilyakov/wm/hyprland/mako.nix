{lib, ...}: {
  services.mako = {
    enable = true;
    settings = {
      border-radius = 9;
      default-timeout = 3000;
      margin = "7,20";
      font = lib.mkForce "JetBrainsMono Nerd Font";
    };
  };
}
