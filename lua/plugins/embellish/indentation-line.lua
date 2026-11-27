---@type vim.pack.Spec
return {
    src = T.gh('nvimdev', 'indentmini.nvim'),
    data = {
        event = 'VimEnter',
        opts = function ()
            require('indentmini').setup({
                char = '|',
                only_current = false,
            })
            vim.api.nvim_set_hl(0, 'IndentLineCurrent', { fg = '#7bc6d0' }) -- 当前层级（高亮色）
        end
    }
}
