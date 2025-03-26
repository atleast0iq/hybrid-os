{ pkgs, ... }:
{
  imports = [
    ./vscode.nix
    ./zed-editor.nix
  ];

  home.packages =
    with pkgs;
    let
      gorgeous-codeblocks = codeblocks.overrideAttrs (oldAttrs: {
        postInstall =
          (oldAttrs.postInstall or "")
          + ''
            substituteInPlace $out/share/applications/codeblocks.desktop \
              --replace "Exec=codeblocks" "Exec=env GTK_THEME=Adwaita codeblocks"
          '';
      });
    in
    [
      jetbrains.pycharm-community
      gorgeous-codeblocks
    ];
}
