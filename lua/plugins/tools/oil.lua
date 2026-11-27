---@type vim.pack.Spec
return {
    src = T.gh('stevearc', 'oil.nvim'),
    data = {
        event = 'VimEnter',
        opts = function ()
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
                    natural_order = 'fast',
                }
            })
        end
    }
}
