{  ... }:
{
  imports = [
    ./plugins
  ];
   programs.nixvim = {
      enable = true;
      defaultEditor = true;
      clipboard.register = "unnamedplus";
      colorschemes.gruvbox.enable = true;

      plugins = {
        lualine.enable = true;
      };
      
      opts = {
        number = true;
        tabstop = 2;
        softtabstop = 2;
        showtabline = 2;
        expandtab = true;
        shiftwidth = 2;
        smartindent = true;
        breakindent = true;
        cursorline = true;
        scrolloff = 8;
        cmdheight = 0;
        wrap = true;
        termguicolors = true;
      };
    };
}
