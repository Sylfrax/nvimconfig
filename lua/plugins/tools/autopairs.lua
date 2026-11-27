---@type vim.pack.Spec
return {
    src = T.gh('windwp', 'nvim-autopairs'),
    data = {
        event = 'VimEnter',
        opts = function ()
            require('nvim-autopairs').setup({
                check_ts = true,
            })
        end
    }
}
