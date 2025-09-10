{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    just
    neovim
    alejandra
  ];

  programs = {
    dconf.enable = true;
    adb.enable = true;
  };

  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];
}
