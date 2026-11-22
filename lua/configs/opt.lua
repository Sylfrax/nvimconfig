vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.cmdheight = 2
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.loaded_matchit = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.shortmess:append({ I = true })

vim.o.shell = 'bash -l'

vim.opt.relativenumber = true
vim.opt.undofile = true
-- keymap
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {desc = '退出终端插入模式'})


vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
