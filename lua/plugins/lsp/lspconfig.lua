vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local map = function (mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end 
    -- 跳转
    map("n", "gd", vim.lsp.buf.definition, "跳到定义")
    map("n", "gD", vim.lsp.buf.declaration, "跳到声明")
    map("n", "gi", vim.lsp.buf.implementation, "跳到实现")    -- 跳到实现
    map("n", "gr", vim.lsp.buf.references, "查看引用")        -- 查看引用
    map("n", "gt", vim.lsp.buf.type_definition, "跳到类型定义")   -- 跳到类型定义

    -- 信息
    map("n", "K", vim.lsp.buf.hover, "悬浮文档")              -- 悬浮文档
    map("n", "<C-k>", vim.lsp.buf.signature_help, "函数签名帮助") -- 函数签名帮助

    -- 修改
    map("n", "<leader>rn", vim.lsp.buf.rename, "重命名")    -- 重命名
    map("n", "<leader>ca", vim.lsp.buf.code_action, "代码操作") -- 代码操作(修复等)
    map("n", "<leader>f", function()                    -- 格式化
      vim.lsp.buf.format({ async = true })
    end, "格式化")

    -- 诊断
    map("n", "[d", vim.diagnostic.goto_prev, "上一个错误")      -- 上一个错误
    map("n", "]d", vim.diagnostic.goto_next, "下一个错误")      -- 下一个错误
    map("n", "<leader>e", vim.diagnostic.open_float, "显示错误详情") -- 显示错误详情
  end,
})
