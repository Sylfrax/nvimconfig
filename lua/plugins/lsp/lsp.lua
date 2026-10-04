

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
vim.api.nvim_create_autocmd("BufReadPre", {
    once = true,
    callback = function()
        vim.pack.add({ gh("neovim", "nvim-lspconfig") })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.env.VIMRUNTIME,
                        checkThirdParty = false,
                    },
                },
            },
        })

        vim.lsp.enable({
            "ocamllsp",
            "rust_analyzer",
            "lua_ls",
            "clangd",
            "hls",
            "gopls",
            "zls"
        })
        vim.notify("Lsp is loaded!")
        require("plugins.lsp.lspconfig")
        require("plugins.lsp.blink")
    end
})
-- Neovim 默认诊断配置
vim.diagnostic.config({
    virtual_text = true,    -- 显示行尾错误信息
    signs = true,           -- 显示符号（你看到的 "E"）
    underline = true,       -- 下划线
})
