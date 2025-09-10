{pkgs, ...}: {
  users.users = {
    atleast0iq = {
      isNormalUser = true;
      description = "Ivan Iliakov";
      extraGroups = [
        "wheel"
        "adbusers"
        "docker"
        "kvm"
        "audio"
        "video"
        "input"
        "scanner"
        "lp"
        "networkmanager"
      ];
      createHome = true;
      home = "/home/atleast0iq";
      shell = pkgs.zsh;

      # TODO: delete
      packages = with pkgs; [
        zed-editor
      ];
    };
  };
}
