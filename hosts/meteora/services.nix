{ config, pkgs, lib, inputs, ... }: {
  services = {
    # autologin in main account
    getty.autologinUser = "iilyakov";
  };
}
