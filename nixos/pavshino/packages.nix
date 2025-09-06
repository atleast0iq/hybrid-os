{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    git
    just
    neovim
  ];

  programs = {
    adb.enable = true;
    zsh.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.droid-sans-mono
    nerd-fonts.ubuntu-mono
    nerd-fonts.space-mono
    google-fonts
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
    inputs.apple-fonts.packages.${pkgs.system}.sf-compact-nerd
    inputs.apple-fonts.packages.${pkgs.system}.ny-nerd
  ];
}
