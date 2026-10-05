vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function ()
        vim.pack.add({ gh('nvimdev', 'indentmini.nvim') })
        require('indentmini').setup({
            char = '|',
            only_current = false,
        })
        vim.api.nvim_set_hl(0, "IndentLineCurrent", { fg = "#7bc6d0" }) -- 当前层级（高亮色）
    end
})
