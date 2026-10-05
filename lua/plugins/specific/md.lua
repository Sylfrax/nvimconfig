vim.api.nvim_create_autocmd("FileType", {
    pattern = 'markdown',
    once = true,
    callback = function ()
        vim.pack.add({ 
            gh('MeanderingProgrammer',  'render-markdown.nvim'),
            gh('nvim-tree', 'nvim-web-devicons')
        })
        require('render-markdown').setup({})
    end
})
