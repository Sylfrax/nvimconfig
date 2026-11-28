---@type Tool
T = require('tool')

---@param specs table
---@param load boolean|function
local function add(specs, load)
    local ok, err = pcall(vim.pack.add, specs, { load = load })
    if not ok then
        vim.notify('vim.pack.add failed: ' .. tostring(err), vim.log.levels.ERROR)
    end
end

-- 依赖先加载，后面的插件 setup 时才能 require 到它们。
add(require('depends'), function (data)
    vim.cmd.packadd(data.spec.name)
end)

local plugs = T.addplug(vim.fn.stdpath('config') .. '/lua/plugins/')
add(plugs, T.lazy)
