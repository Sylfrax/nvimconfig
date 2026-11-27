---@type vim.pack.Spec
return {
    src = T.gh('nvim-lualine', 'lualine.nvim'),
    data = {
        event = 'VimEnter',
        opts = function ()
            require('lualine').setup({
                options = {
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                }
            })
        end
    }
}
