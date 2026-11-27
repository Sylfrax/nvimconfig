---@type Tool
T = require('tool')

local plugs = T.addplug(vim.fn.stdpath('config') .. '/lua/plugins/')

vim.pack.add({
    T.gh('nvim-tree', 'nvim-web-devicons'),
    T.gh('MunifTanjim', 'nui.nvim'),
    T.gh('rcarriga', 'nvim-notify'),
}, {
    load = function (data)
        vim.cmd.packadd(data.spec.name)
    end
})


vim.pack.add(plugs, { load = T.lazy })
