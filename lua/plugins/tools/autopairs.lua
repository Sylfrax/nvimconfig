vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function ()
        vim.pack.add({ gh('windwp', 'nvim-autopairs') })
        require('nvim-autopairs').setup({
            check_ts = true,
        })
    end
})


