vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'markdown', 'opencode_output' },
    once = true,
    callback = function ()
        vim.cmd.packadd('render-markdown.nvim')
        require('render-markdown').setup({
            anti_conceal = { enabled = false },
            file_types = { 'markdown', 'opencode_output' },
        })
    end
})
