{pkgs, ...}: {
  users = {
    users.iilyakov = {
      isNormalUser = true;
      description = "Ivan Ilyakov";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "docker"
        "adbusers"
        "scanner"
        "lp"
      ];
      createHome = true;
      home = "/home/iilyakov";
      shell = pkgs.zsh;
    };
  };
}
