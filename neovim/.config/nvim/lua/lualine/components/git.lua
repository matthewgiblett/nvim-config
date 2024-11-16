local M = require("lualine.components.diff"):extend()

local default_options = {
	icon = {
		"", -- e702
		color = { fg = "#f14e32" },
	},
	symbols = {
		added = "", -- f067
		modified = "", -- f141
		removed = "", -- f068
	},
	source = function()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end,
	cond = function()
		return vim.b.gitsigns_head ~= nil
	end,
	ignore_branches = {
		"main",
		"master",
	},
}

function M:init(options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("force", self.options or {}, default_options)
	self:create_option_highlights()
end

function M:update_status(is_focused)
	local diff = M.super.update_status(self, is_focused)
	local branch = vim.b.gitsigns_head
	if not vim.tbl_contains(self.options.ignore_branches, branch) and vim.bo.buftype == "" then
		return branch .. " " .. diff
	end
	if diff == "" then
		return " "
	end
	return diff
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
