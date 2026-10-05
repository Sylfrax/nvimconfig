
vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function ()
        vim.pack.add({  gh('stevearc', 'oil.nvim') })
        require('oil').setup({
            default_file_explorer = true,
            columns = { 
                'icon',
                'type',
                'size',
                'mtime',
                'permissions',
            },
            view_options = {
                show_hidden = true,
                natural_order = 'fast'
            }
        })
    end 
})
