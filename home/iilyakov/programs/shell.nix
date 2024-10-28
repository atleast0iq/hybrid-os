{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs = {
    git = {
      enable = true;
      userName = "Ivan Ilyakov";
      userEmail = "karginux@ya.ru";
      extraConfig.init.defaultBranch = "main";
    };

    starship = {
      enable = true;
      enableZshIntegration = true;

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

    zsh = {
      enable = true;
      enableCompletion = true;
      completionInit = ''
        autoload bashcompinit && bashcompinit
        autoload -Uz compinit && compinit
        compinit
      '';
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ls = "exa";
        ll = "exa -l";
        la = "exa -la";
      };
    };
  };
}
