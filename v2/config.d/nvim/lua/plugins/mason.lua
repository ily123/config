local tools = {
    { "pyright", "1.1.391" },
    { "ruff",    "0.8.4"  },
}

local function config()
    require("mason").setup()
    local registry = require("mason-registry")
    local mason_refresh = function()
        for _, tool in ipairs(tools) do
            local name, version = tool[1], tool[2]
            local ok, pkg = pcall(registry.get_package, name)
            if ok and not pkg:is_installed() then
                vim.notify("Mason: installing " .. name .. "@" .. version)
                pkg:install({ version = version })
            end
        end
    end
    registry.refresh(mason_refresh)
end

return {
    "mason-org/mason.nvim",
    config = config,
}
