return {
    src = T.gh('seblyng', 'roslyn.nvim'),
    data = {
        ft = 'cs',
        opts = function ()
            vim.env.DOTNET_gcServer = '0'
            require('roslyn').setup({})
        end
    }
}
