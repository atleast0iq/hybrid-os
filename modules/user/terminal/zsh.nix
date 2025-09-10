{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    completionInit = ''
      autoload bashcompinit && bashcompinit
      autoload -Uz compinit && compinit
      compinit
    '';
    initContent = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
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
