vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function ()
        vim.pack.add({
            gh('nvim-tree', 'nvim-tree.lua'),
            gh('nvim-tree', 'nvim-web-devicons')
        })
        require('nvim-tree').setup({
            view = { width = 30 },
            filters = { dotfiles = true }
        })
        vim.keymap.set('n', '<Leader>nt', '<CMD>NvimTreeToggle<CR>', { desc = '打开文件树' })
    end 
})
