{ ... }: 
{
  programs.nixvim = {
    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;

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
      colorcolumn = "150";
      showmode = false;
    };
  };
}
