vim.api.nvim_create_autocmd('LspAttach', {
    callback = function (args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})

---@type vim.pack.Spec
return {
    src = T.gh('neovim', 'nvim-lspconfig'),
    data = {
        event = 'UIEnter',
        opts = function ()
            vim.lsp.enable({
                'emmylua_ls',
                'rust_analyzer',
                'clangd',
                'hls',
                'gopls',
                'zls',
                'bashls',
                'pylsp',
            })
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = true,
                signs = true,           -- 显示符号（你看到的 'E'）
                underline = true,       -- 下划线
            })
        end
    }
}
