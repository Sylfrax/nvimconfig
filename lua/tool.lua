---@class Tool
---@field gh function
---@field addplug function
---@field lazy function
local M = {}

---@param name string
---@param repo string
M.gh = function (name, repo)
    return ("https://github.com/%s/%s"):format(name, repo)
end

---@param dir string
---@return table
M.addplug = function(dir)
    ---@type table
    local names = {}
    for name in vim.fs.dir(dir) do names[#names + 1] = name end
    table.sort(names)

    local p = {}
    for _, n in ipairs(names) do
        local path = dir .. "/" .. n
        if vim.fn.isdirectory(path) == 1 then
            vim.list_extend(p, M.addplug(path))
        elseif n:match("%.lua$") then
            local ok, spec = pcall(dofile, path)
            if not ok then
                vim.notify(
                    ("failed to load plugin spec %s: %s"):format(path, spec),
                    vim.log.levels.ERROR
                )
            elseif type(spec) == "table" then
                p[#p + 1] = spec
            end
        end
    end
    return p
end


---@class Data
---@field event? string|string[]
---@field ft? string|string[]
---@field once? boolean
---@field opts? function

---@class Spec : vim.pack.Spec
---@field data? Data

---@param plug vim.pack.PlugData
M.lazy = function(plug)
    ---@cast plug.spec Spec

    local d = plug.spec.data or {}
    local name = plug.spec.name
    local packadded = false

    local function notify_err(stage, err)
        vim.notify(
            ("plugin %s: %s failed: %s"):format(name, stage, err),
            vim.log.levels.ERROR
        )
    end

    local function load(ev)
        if not packadded then
            local ok, err = pcall(function () vim.cmd.packadd(name) end)
            if not ok then
                notify_err("packadd", err)
                return
            end
            packadded = true
        end

        if d.opts then
            local ok, err = pcall(d.opts, ev)
            if not ok then
                notify_err("setup", err)
            end
        end
    end

    local once = d.once ~= false

    if d.event then
        vim.api.nvim_create_autocmd(d.event, {
            once = once,
            callback = load,
        })
    end

    if d.ft then
        vim.api.nvim_create_autocmd("FileType", {
            once = once,
            pattern = d.ft,
            callback = load,
        })
    end

    -- 只有既没有 event 也没有 ft 的插件才立即加载。
    -- 旧实现把 else 挂在 if d.ft 上，导致所有 event 插件在启动时被加载一次，
    -- 事件触发时又被加载一次。
    if not d.event and not d.ft then
        load()
    end
end

return M
