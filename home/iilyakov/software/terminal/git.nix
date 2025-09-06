{...}: {
  programs.git = {
    enable = true;
    userName = "Ivan Ilyakov";
    userEmail = "karginux@ya.ru";
    extraConfig.init.defaultBranch = "main";
  };
}
