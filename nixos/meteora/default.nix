{self, ...}: let
  sysmod = "${self}/modules/system";
in {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix

    "${sysmod}/amnezia-vpn.nix"
    "${sysmod}/nix.nix"
  ];

  boot = {
    kernelModules = ["amdgpu" "v4l2loopback" "ideapad_laptop"];
  };
}
