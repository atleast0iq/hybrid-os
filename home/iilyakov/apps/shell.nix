{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  nu_scripts = "${pkgs.nu_scripts}/share/nu_scripts";
in {
  programs = {
    git = {
      enable = true;
      userName = "Ivan Ilyakov";
      userEmail = "karginux@ya.ru";
      extraConfig.init.defaultBranch = "main";
    };

    starship = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        format = ''
          $username@$hostname: $directory $character
        '';

        right_format = ''
          $cmd_duration
        '';

        scan_timeout = 10;
        line_break.disabled = true;

        directory = {
          format = "[$path](green)";
          truncation_length = 2;
          truncation_symbol = "../";
          truncate_to_repo = false;
        };

        username = {
          show_always = true;
          format = "[$user](bold blue)";
        };

        hostname = {
          ssh_only = false;
          format = "[$hostname](bold blue)";
        };
      };
    };

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
