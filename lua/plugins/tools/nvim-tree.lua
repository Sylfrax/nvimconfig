vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function ()
        vim.cmd.packadd('nvim-tree.lua')
        require('nvim-tree').setup({
            view = { width = 30 },
            filters = { dotfiles = true }
        })
        vim.keymap.set('n', '<Leader>nt', '<CMD>NvimTreeToggle<CR>', { desc = '打开/关闭文件树' })
        vim.keymap.set('n', '<Leader>nf', '<CMD>NvimTreeFocus<CR>', { desc = '打开/聚焦文件树' })
    end 
})
