vim.api.nvim_create_autocmd('BufReadPost', {
    once = true,
    callback = function ()
        vim.cmd.packadd('bufferline.nvim')
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
