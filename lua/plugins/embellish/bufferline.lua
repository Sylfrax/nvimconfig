vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function ()
        vim.cmd.packadd('bufferline.nvim')
        require('bufferline').setup({
            options = {
                mode = 'buffers',
                separator_style = 'slant',
                always_show_bufferline = false,
                show_buffer_close_icons = true,
            }
        })
    end
})
