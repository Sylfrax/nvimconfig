---@type Tool
T = require('tool')

local plugs = T.addplug(vim.fn.stdpath('config') .. '/lua/plugins/')

vim.pack.add(plugs, { load = T.lazy })

vim.cmd.packadd('nvim-web-devicons')
vim.cmd.packadd('nui.nvim')
vim.cmd.packadd('nvim-notify')
