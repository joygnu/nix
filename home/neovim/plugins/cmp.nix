{ ... }:
{
  programs.nixvim = {
    plugins = {
      cmp-nvim-lsp.enable = true;
      cmp_luasnip.enable = true;
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = { ghost_text = true; };
          performance = {
            debounce = 57;
            fetchingTimeout = 197;
            maxViewEntries = 27;
          };

          snippet.expand = ''
            function(args)
            require('luasnip').lsp_expand(args.body)
            end
            '';

          formatting.fields = ["kind" "abbr" "menu"];

          sources = [
          { 
            name = "nvim_lsp";
          }
          {
            name = "luasnip";
          }
          ];

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
          };

          window = {
            completion.border = "solid";
            documentation.border = "solid";
          };
        };
      };
    };
    extraConfigLua = ''
      luasnip = require("luasnip")
      kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      } 
    '';
  };
}
