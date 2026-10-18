vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function ()
        vim.cmd.packadd('nvim-autopairs')
        require('nvim-autopairs').setup({
            check_ts = true,
        })
    end
})


