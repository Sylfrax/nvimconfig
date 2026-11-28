---@type vim.pack.Spec
return {
    src = T.gh('olimorris', 'onedarkpro.nvim'),
    data = {
        opts = function ()
            local theme = 'onedark'

            require('onedarkpro').setup({
                theme = theme,
            })

            vim.cmd.colorscheme(theme)
        end
    }
}
