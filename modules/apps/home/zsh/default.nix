{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    shellAliases = {
      cn = "cd ~/nix";
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      v = "hx";
      cat = "bat";
      pu = "sh ~/nix/modules/apps/home/zsh/scripts/push.sh";
      ip = "sh ~/nix/modules/apps/home/zsh/scripts/ip.sh";
      rb = "sh ~/nix/modules/apps/home/zsh/scripts/rebuild.sh";
      fr = "sudo systemctl reboot --firmware";
      up = "sudo nix flake update ~/nix";
      del = "sudo nix-collect-garbage -d";
      dn = "dotnet new console";
      dr = "dotnet run";
      backup = "tar -czvf ~/config_backup.tar.gz ~/.config/zsh";
    };

    history.size = 1000000;
    history.path = ".config/zsh/history";

    # plugins = [
      # {
        # name = "zsh-autosuggestions";
        # src = pkgs.fetchFromGitHub {
          # owner = "zsh-users";
          # repo = "zsh-autosuggestions";
          # rev = "v0.4.0";  # Version
          # sha256 = "sha256-bBqJCkhygrXqAfWBsvUNpXu9IrwLyn/ypmTRKSVP0Xw=";  # Fetched hash
        # };
      # }
    # ];
   # };
      oh-my-zsh = {
    enable = true;
    plugins = [ "git" "history-substring-search" ];
    theme = "simple";
  };
  };
}
