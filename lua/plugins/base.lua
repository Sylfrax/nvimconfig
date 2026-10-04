
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

    --color scheme
    gh("olimorris", "onedarkpro.nvim"),
    --lsp config
--    gh("neovim", "nvim-lspconfig"),
    -- lualine
--    gh("nvim-lualine", "lualine.nvim"),


--    gh("nvim-treesitter", "nvim-treesitter"),
    
--    gh_v("saghen", "blink.cmp", "v1.10.2"),

    --mini.nvim
--    gh("echasnovski", "mini.nvim")
}


vim.pack.add(plugins)
require("plugins.tools.mini")

require("plugins.embellish.colorscheme")

require("plugins.tools.which-key")
require("plugins.embellish.lualine")

require("plugins.lsp.tree")
require("plugins.lsp.lsp")


