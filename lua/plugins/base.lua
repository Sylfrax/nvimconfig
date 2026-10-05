
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
    return { src = "https://github.com/"..name.."/"..repo }
end

---@param name string
---@param repo string
---@param ver string
---@return table
gh_v = function (name, repo, ver)
    return { src = tool_pin(name, repo), version = ver }
end
local plugins = {
    gh("olimorris", "onedarkpro.nvim"),
}

vim.pack.add(plugins)
require("plugins.tools.mini")

require("plugins.embellish.colorscheme")
require("plugins.embellish.alpha")
require('plugins.embellish.indentation-line')

require("plugins.tools.which-key")
require('plugins.tools.autopairs')
require("plugins.embellish.lualine")

require("plugins.lsp.tree")
require("plugins.lsp.lsp")

