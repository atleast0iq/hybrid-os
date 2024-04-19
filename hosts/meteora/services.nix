{ config, pkgs, lib, inputs, ... }: {
  # ssh
  services.openssh = {
    enable = true;
  };
}
