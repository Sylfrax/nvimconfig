---@type vim.pack.Spec
return {
    src = T.gh('folke', 'which-key.nvim'),
    data = {
        event = 'VimEnter',
        opts = function ()
            require('which-key').setup({
                triggers = {
                    { '<Leader>', mode = { 'n', 'v' } }
                }
            })
            vim.keymap.set({ 'n', 'x' }, '<Leader>k', function ()
                local key = vim.fn.input('输入要查找的快捷键(空则全部输出): ')
                if key == '' then
                    require('which-key').show()
                else
                    require('which-key').show({ keys = key })
                end
            end, {
                desc = '查找快捷键',
            })
        end
    }
}
