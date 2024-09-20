{ pkgs, ... }:

{
  programs.neovim = {
    defaultEditor = true;

    # Plugins
    plugins = with pkgs.vimPlugins; [

      # Colorschemes
      catppuccin-nvim

      # Treesitter for syntax highlighting
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = ''
          packadd! nvim-treesitter
        '';
      }

      # Git integration for buffers
      {
        plugin = gitsigns-nvim;
        config = ''
        '';
      }

      {
        plugin = indent-blankline-nvim;
        config = ''

        '';
      }
    ];

    # Neovim options
    extraLuaConfig = ''
      o = vim.opt

      -- Set colorsceme
      vim.cmd[[colorscheme catppuccin-frappe]]

      -- Line numbers
      o.number = true
      o.relativenumber = true

      -- Indenting
      o.autoindent = true
      o.expandtab = true
      o.shiftwidth = 2
      o.tabstop = 2

      -- Cursor
      o.cursorline = true
      o.scrolloff = 20
      o.wrap = true

      -- Window
      o.splitright = true
      o.splitbelow = true
      o.termguicolors = true

      -- Misc
      o.showmatch = true -- Jumps cursor to corresponding bracket
      o.clipboard = "unnamedplus"
      o.title = true
    '';

  };
}
