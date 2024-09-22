{  pkgs, ... } :

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    dotDir = ".config/zsh";
    initExtra = "PROMPT='%F{green}%~%f '";
 
    shellAliases = {
      v = "hx";
      ser = "ssh root@joygnu.org";
      rb = "nix-on-droid switch --flake ~/.config/nix-on-droid";
      ep = "hx ~/.config/nix-on-droid/nix-on-droid.nix";
    };

    history.size = 1000000;
    history.path = ".config/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ 
#      "history-substring-search"
      ];
    };

  };
}
