{pkgs-stable, ...}: {
  console = {
    earlySetup = true;
    packages = with pkgs-stable; [terminus_font];
    font = "ter-v24n";
    keyMap = "us";
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  environment.pathsToLink = ["/share/zsh"];
}
