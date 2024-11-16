local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require({
	auto = "lualine.themes.auto",
	highlight = "lualine.highlight",
	mode = "lualine.utils.mode",
	utils = "lualine.utils.utils",
})

local M = {}

function M.apply_default_colors(options, default_options)
	local default_colors = {}
	for k, v in pairs(default_options.colors) do
		default_colors[k] = {
			fg = modules.utils.extract_color_from_hllist(v.scope, v.syntaxlist, v.default),
		}
	end
	options.colors = vim.tbl_deep_extend("keep", options.status_colors or {}, default_colors)
	return options
end

function M.get_mode_color()
	local mode = string.lower(modules.mode.get_mode())
	local mode_colors = modules.auto[mode] or modules.auto.normal
	return { fg = mode_colors.a.bg }
end

function M.transparent_auto()
	local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
	for _, field in ipairs(lualine_modes) do
		if modules.auto[field] and modules.auto[field].c then
			modules.auto[field].c.bg = "NONE"
		end
	end
	return modules.auto
end

return M
