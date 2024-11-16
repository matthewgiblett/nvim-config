local lualine_require = require("lualine_require")

local M = lualine_require.require("lualine.component"):extend()

local default_options = {
	icon = "", -- f124
	divider = "", -- eea9
	boundary_labels = { top = "Top", bottom = "Bot" },
}

function M:init(options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
end

function M:update_status()
	local col = vim.fn.charcol(".")
	local line_num = vim.fn.line(".")
	local line_count = vim.api.nvim_buf_line_count(0)

	local digits = #tostring(line_count)

	local line_format = string.format("%%0%dd/%%0%dd", digits, digits)
	local line = string.format(line_format, line_num, line_count)
	local column = string.format(" %-2d", col)

	local progress
	if line_num == 1 then
		progress = self.options.boundary_labels.top
	elseif line_num == line_count then
		progress = self.options.boundary_labels.bottom
	else
		progress = string.format("%2.0f", (line_num / line_count) * 100) .. "%%"
	end
	progress = " (" .. progress .. ") "

	return line .. progress .. self.options.divider .. column
end

return M
