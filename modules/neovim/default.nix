{ ... }:
{
  home-manager.users.joy = {
    imports = [
      ./plugins
        ./set.nix
    ];
   programs.nixvim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      clipboard.register = "unnamedplus";
      colorschemes.catppuccin.enable = true;

      plugins = {
        presence-nvim = {
          enable = true;
          mainImage = "file";
        };
        bufferline = {
          enable = true;
          separatorStyle = "slope";
        };
        treesitter = {
          enable = true;
          indent = true;
          nixvimInjections = true;
        };
        treesitter-context.enable = true;
        nvim-tree = {
          enable = true;
          renderer.groupEmpty = true;
        };
        lualine.enable = true;
      };

      keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>NvimTreeToggle<CR>";
      }
      ];
    };
  };
}
