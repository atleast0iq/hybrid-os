{unstable, ...}: {
  imports = [
    ./zed.nix
    ./nixvim
  ];

  home.packages = with unstable; [
    jetbrains.clion
  ];
}
