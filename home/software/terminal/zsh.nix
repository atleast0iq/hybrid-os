{ ... }:
{
  programs.zsh = {
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
}
