vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function()
        vim.cmd.packadd('noice.nvim')

        require('noice').setup({
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
            lsp = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            }
        })
    end
})
