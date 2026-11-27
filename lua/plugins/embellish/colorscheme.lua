---@type vim.pack.Spec
return {
    src = T.gh('olimorris', 'onedarkpro.nvim'),
    data = {
        event = 'VimEnter',
        opts = function ()
            local theme = 'onedark'

            require('onedarkpro').setup({
                theme = theme,
            })

            vim.cmd.colorscheme(theme)
        end
    }
}
