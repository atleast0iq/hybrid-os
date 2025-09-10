{lib, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = lib.concatStrings [
        "$python"
        "$username@$hostname: "
        "$directory "
        "$character"
      ];

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

      python = {
        format = "\\($virtualenv $version\\) ";
      };
    };
  };
}
