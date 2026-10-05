vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()

        vim.pack.add({ gh("nvimdev", "dashboard-nvim"), 
            gh("nvim-tree", "nvim-web-devicons") })
            require('dashboard').setup({
                theme = 'hyper',
                config = {
                    header = {
                        "                  < Welcome >                     ",
                        "             /*  TERMINAL IS ALL  */              ",
                        "         _____       ______                       ",
                        "        / ___/__  __/ / __/________ __  __        ",
                        "        \\__ \\/ / / / / /_/ ___/ __ `/ |/_/      ",
                        "       ___/ / /_/ / / __/ /  / /_/ />  <          ",
                        "      /____/\\__, /_/_/ /_/   \\__,_/_/|_|        ",
                        "           /____/                                 ",
                        ">_               -- Out of World --             >_",
                    },
                }
        })
        vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#7bc6d0', bold = true })
        vim.api.nvim_set_hl(0, 'DashboardProjectTitle', { fg = '#7bc6d0', bold = true })
        vim.api.nvim_set_hl(0, 'DashboardMruTitle', { fg = '#7bc6d0', bold = true })
        vim.api.nvim_set_hl(0, 'DashboardShortCut', { fg = '#7bc6d0', bold = true })
    end 
})
