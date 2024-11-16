local lualine_require = require("lualine_require")
local utils = require("lualine.utils")

local M = lualine_require.require("lualine.component"):extend()

local default_options = {
	icon = {
		"󰒲", -- f04b2
		color = utils.get_mode_color,
	},
	cond = require("lazy.status").has_updates,
}

function M:init(options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
	self:create_option_highlights()
end

function M:update_status()
	local Checker = require("lazy.manage.checker")
	local updates = #Checker.updated
	return tostring(updates)
end

return M
