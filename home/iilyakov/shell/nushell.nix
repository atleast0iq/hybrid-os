{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: let
  nu_scripts = "${pkgs.nu_scripts}/share/nu_scripts";
in {
  programs = {
    nushell = {
      enable = true;

      extraConfig = ''
        $env.config = {
          show_banner: false

          completions: {
            case_sensitive: false
            quick: true
            partial: true
            algorithm: "prefix"
            external: {
              enable: true
              max_results: 100
              completer: null
            }
          }
        }

        # modules
        use ${nu_scripts}/modules/nix/nix.nu *
        use ${nu_scripts}/custom-completions/curl/curl-completions.nu *
        use ${nu_scripts}/custom-completions/git/git-completions.nu *
        use ${nu_scripts}/custom-completions/just/just-completions.nu *
        use ${nu_scripts}/custom-completions/make/make-completions.nu *
        use ${nu_scripts}/custom-completions/man/man-completions.nu *
        use ${nu_scripts}/custom-completions/nix/nix-completions.nu *
        use ${nu_scripts}/custom-completions/tar/tar-completions.nu *
      '';
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
