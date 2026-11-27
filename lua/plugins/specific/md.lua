---@type vim.pack.Spec
return {
    src = T.gh('MeanderingProgrammer', 'render-markdown.nvim'),
    data = {
        event = 'VimEnter',
        opts = function ()
            require('render-markdown').setup({
                anti_conceal = { enabled = false },
                file_types = { 'markdown', 'opencode_output' },
            })
        end
    }
}
