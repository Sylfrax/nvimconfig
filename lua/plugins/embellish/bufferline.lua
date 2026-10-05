vim.api.nvim_create_autocmd('BufReadPost', {
    once = true,
    callback = function ()
        vim.pack.add({
            gh('akinsho', 'bufferline.nvim'),
            gh('nvim-tree', 'nvim-web-devicons'),
        })
        require('bufferline').setup({
            options = {
                mode = 'buffers',
                separator_style = 'slant',
                always_show_bufferline = true,
                show_buffer_close_icons = true,
            }
        })
    end
})
