{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Plugins
    plugins = with pkgs.vimPlugins; [

      # Colorschemes
      catppuccin-nvim

      # mini pairs for auto placing of brackets
      {
        plugin = mini-nvim;
        config = ''
          lua << END
            require("mini.pairs").setup()
          END
        '';
      }

      # Debug protocol
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

      # IBL for indent lines
      {
        plugin = indent-blankline-nvim;
        config = ''
          lua << END
            require("ibl").setup { 
          scope = { enabled = false }, 
          }
          END
        '';
      }

      # Status bar
      {
        plugin = lualine-nvim;
        config = ''
          lua << END
            require("lualine").setup()
          END
        '';
      }

      # Startup screen
      {
        plugin = alpha-nvim;
        config = ''
        lua << END
          require("alpha").setup(require'alpha.themes.startify'.config)
        END
        '';
      }

      # Better terminal
      #{
      #  plugin = toggleterm-nvim;
      #  config = ''
      #    lua << END
      #      require("toggleterm").setup {
      #        open_mapping = [[<leader>t]],
      #        direction = float,
      #        hide_numbers = true,
      #        autochdir = true, -- Does the terminal follow the current working directory of neovim?
      #        insert_mappings = false, -- Can the terminal be opened in insert mode?
      #        terminal_mappings = false, -- Can the terminal be opened in terminal mode?
      #      }
      #    END
      #  '';
      #}

      # File icons
      {
        plugin = nvim-web-devicons;
        config = ''
          lua << END
            require("nvim-web-devicons").setup()
          END
        '';
      }

      # File explorer
      {
        plugin = nvim-tree-lua;
        config = ''
          lua << END
            require("nvim-tree").setup()
          END
        '';
      }

      # Treesitter for better syntax highlighting
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
      k = vim.keymap

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

      -- Keybinds
      vim.g.mapleader = " " -- Leader key
      k.set("n", " ", "<Nop>")

      k.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>") -- Open nvim-tree with leader + e

      -- ctrl + hjkl to move through windows
      k.set("n", "<C-h>", "<C-w>h")
      k.set("n", "<C-j>", "<C-w>j")
      k.set("n", "<C-k>", "<C-w>k")
      k.set("n", "<C-l>", "<C-w>l")
      
      
    '';

  };
}
