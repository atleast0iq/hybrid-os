{unstable, ...}: {
  programs.zed-editor = {
    enable = true;
    package = unstable.zed-editor;
    extensions = [
      "nix"
      "just"
    ];
  };
}
