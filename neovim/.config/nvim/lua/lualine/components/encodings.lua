local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require({
	utils = "lualine.utils.utils",
})

local M = lualine_require.require("lualine.component"):extend()

local default_options = {
	symbols = {
		bomb = "󰚑", -- f0691
		["utf-8"] = "󰻐", -- f0ed0
	},
	color = {
		fg = modules.utils.extract_color_from_hllist(
			"fg",
			{ "LuaLineDiffChange", "GitSignsChange", "GitGutterChange", "DiffChanged", "DiffChange" },
			"#BFECFF"
		),
	},
}

function M:init(options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
	self:create_option_highlights()
end

function M:update_status()
	local result = vim.opt.fileencoding:get()
	if self.options.symbols[result] then
		result = self.options.symbols[result]
	end
	if vim.opt.bomb:get() then
		result = result .. " " .. self.options.symbols.bomb
	end
	if self.options.color_highlight then
		result = self:format_hl(self.options.color_highlight) .. result
	end
	return result
end

return M
