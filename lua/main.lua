LoadPlugins = function (dir)
    local names = {}
    for name in vim.fs.dir(dir) do names[#names + 1] = name end
    table.sort(names)
    for _, name in ipairs(names) do
        local path = dir .. "/" .. name
        if vim.fn.isdirectory(path) == 1 then
            LoadPlugins(path)
        elseif name:match("%.lua$") then
            dofile(path)
        end
    end
end

LoadP = function (dir)
    LoadPlugins(vim.fs.normalize(dir))
end


---@param name string
---@param repo string
---@return string
local tool_pin = function (name, repo)
    return "https://github.com/"..name.."/"..repo 
end
---@param name string
---@param repo string
---@return table
gh = function (name, repo)
    return { src = tool_pin(name, repo) }
end

---@param name string
---@param repo string
---@param ver string
---@return table
gh_v = function (name, repo, ver)
    return { src = tool_pin(name, repo), version = ver }
end


local plugins = {
    gh('nvim-tree', 'nvim-web-devicons'),

    gh("olimorris", "onedarkpro.nvim"),
    gh('akinsho', 'bufferline.nvim'),
    gh('folke', 'noice.nvim'),
    
    gh('MunifTanjim', 'nui.nvim'),
    gh('rcarriga', 'nvim-notify'),

    gh_v("saghen", "blink.cmp", "v1.10.2"),

    gh("nvimdev", "dashboard-nvim"), 
    gh('stevearc', 'oil.nvim'), 
    gh('nvimdev', 'indentmini.nvim'),
    gh("folke", "which-key.nvim"),
    gh('windwp', 'nvim-autopairs'),
    gh("nvim-lualine", "lualine.nvim"),
    gh('ibhagwan', 'fzf-lua'),

    gh('brenoprata10', 'nvim-highlight-colors'),

    -- wait delete    gh("nvim-treesitter", "nvim-treesitter"),
    gh('romus204', 'tree-sitter-manager.nvim'),
    gh("neovim", "nvim-lspconfig"),
    gh('nvim-tree', 'nvim-tree.lua'),
    gh('MeanderingProgrammer',  'render-markdown.nvim'),
}

vim.pack.add(plugins, { load = function() end })

vim.cmd.packadd('nvim-web-devicons')
vim.cmd.packadd('nui.nvim')
vim.cmd.packadd('nvim-notify')


LoadP('~/.config/nvim/lua/plugins/')
--[[require('plugins.embellish.bufferline')
require('plugins.embellish.noice')

require("plugins.embellish.colorscheme")
require("plugins.embellish.dashboard")
require("plugins.embellish.lualine")
require('plugins.tools.oil')
require('plugins.embellish.indentation-line')

require("plugins.tools.which-key")
require('plugins.tools.autopairs')
require('plugins.tools.fzf')
require('plugins.embellish.highlight-color')
require("plugins.lsp.treesitter")
require("plugins.lsp.lsp")
require('plugins.tools.nvim-tree')
require('plugins.specific.md')]]    
