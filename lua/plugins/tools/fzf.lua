---@type vim.pack.Spec
return {
    src = T.gh('ibhagwan', 'fzf-lua'),
    data = {
        event = 'VimEnter',
        opts = function ()
            require('fzf-lua').setup({
                winopts = {
                    height = 0.50,
                    width = 0.45,
                    border = 'rounded',
                    preview = {
                        layout = 'flex',
                    },
                    fzf_opts = {
                        ['--layout'] = 'default',
                    },
                    file_icons = true,
                }
            })
            vim.keymap.set({ 'n', 'x' }, 'Ff', ':Fzf files', { desc = '查找文件' })
        end
    }
}
