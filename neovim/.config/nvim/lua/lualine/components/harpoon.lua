local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require({
	highlight = "lualine.highlight",
	harpoon2 = "lualine.components.harpoon2",
})
local utils = require("lualine.utils")

local M = modules.harpoon2:extend()

local default_options = {
	icon = {
		"", -- f13d
		color = utils.get_mode_color,
	},
	indicators = {
		"󰰡", -- f0c21
		"󰰰", -- f0c30
		"󰰒", -- f0c12
		"󰰏", -- f0c0f
	},
	active_indicators = {
		"󰬚", -- f0b1a
		"󰬟", -- f0b1f
		"󰬕", -- f0b15
		"󰬔", -- f0b14
	},
	_separator = " ",
	-- separator = { left = "", right = "" },
	color_active = utils.get_mode_color,
}

function M:init(options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("force", self.options or {}, default_options)
	self:create_option_highlights()
	if self.options.color_active then
		self.color_active_hl = modules.highlight.create_component_highlight_group(
			self.options.color_active,
			"harpoon_active",
			self.options
		)
	end
end

return M
