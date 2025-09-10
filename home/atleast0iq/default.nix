{self, ...}: let
  usermod = "${self}/modules/user";
in {
  imports = [
    "${usermod}/terminal"
  ];

  home = {
    stateVersion = "24.05";

    username = "atleast0iq";
    homeDirectory = "/home/atleast0iq";
  };

  programs.home-manager.enable = true;
}
