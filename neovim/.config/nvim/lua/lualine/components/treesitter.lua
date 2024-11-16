local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require({
	utils = "lualine.utils.utils",
})

local M = lualine_require.require("lualine.component"):extend()

local default_options = {
	icon = {
		"", -- e21c
		color = {
			fg = modules.utils.extract_color_from_hllist(
				"fg",
				{ "LuaLineDiffAdd", "GitSignsAdd", "GitGutterAdd", "DiffAdded", "DiffAdd" },
				"#90ee90"
			),
		},
	},
	icon_only = true,
	cond = function()
		return vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil
	end,
}

function M:init(options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
	self:create_option_highlights()
end

function M:update_status()
	return " "
end

function M:apply_icon()
	local icon = self.options.icon
	if self.options.icons_enabled and icon then
		if type(icon) == "table" then
			icon = icon[1]
		end
		if self.options.icon_color_highlight then
			icon = self:format_hl(self.options.icon_color_highlight) .. icon .. self:get_default_hl()
		end
		if self.options.icon_only then
			self.status = icon
		elseif type(self.options.icon) == "table" and self.options.icon.align == "right" then
			self.status = table.concat({ self.status, icon }, " ")
		else
			self.status = table.concat({ icon, self.status }, " ")
		end
	end
end

return M
