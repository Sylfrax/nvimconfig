---@type vim.pack.Spec
return {
    src = T.gh('akinsho', 'bufferline.nvim'),
    data = {
        event = 'VimEnter',
        opts = function ()
            require('bufferline').setup({
                options = {
                    mode = 'buffers',
                    separator_style = 'slant',
                    always_show_bufferline = false,
                    show_buffer_close_icons = true,
                }
            })
        end
    }
}
