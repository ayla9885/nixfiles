
-- Shorter option alais
o = vim.opt

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

-- Window
o.splitright = true
o.splitbelow = true
o.termguicolors = true



-- Misc
o.showmatch = true -- When placing a closing bracket, jumps cursor to opening bracket
o.clipboard = "unnamedplus" -- Uses clipboard for everything except yank
o.title = true
