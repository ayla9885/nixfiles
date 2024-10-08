{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Plugins
    plugins = with pkgs.vimPlugins; [

      # Colorschemes
      catppuccin-nvim

      {
        plugin = mini-nvim;
        config = ''
          lua << END
            require("mini.pairs").setup()
          END
        '';
      }

      # Debug
      {
        plugin = nvim-dap;
        config = ''
        '';
      }

      # Git integration for buffers
      {
        plugin = gitsigns-nvim;
        config = ''
          lua << END
            require("gitsigns").setup()
          END
        '';
      }

      {
        plugin = indent-blankline-nvim;
        config = ''
          lua << END
            require("ibl").setup()
          END
        '';
      }

      # Treesitter for syntax highlighting
      {
        plugin = nvim-treesitter;
        config = ''
          packadd! nvim-treesitter
          lua << END
            require'nvim-treesitter.configs'.setup {
              highlight = {
                enable = true,
                disable = {},
              },
            }
          END
        '';
      }
      nvim-treesitter.withAllGrammars

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
