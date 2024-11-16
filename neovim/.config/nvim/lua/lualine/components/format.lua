local utils = require("lualine.utils")

local M = require("lualine.components.diff"):extend()

local default_options = {
	symbols = {
		unix = "", -- ebc6
		dos = "", -- e70f
		mac = "", -- e711
	},
	icons_enabled = true,
	colors_enabled = true,
	colors = {
		unix = {
			scope = { "fg" },
			syntaxlist = { "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "Normal" },
			default = "#D4BEE4",
		},
		dos = {
			scope = { "fg" },
			syntaxlist = {},
			default = "#00a1f1",
		},
		mac = {
			scope = { "fg" },
			syntaxlist = {},
			default = "#b07be6",
		},
	},
}

function M:init(options)
	M.super.init(self, options)
	self.options = utils.apply_default_colors(self.options, default_options)
	self.options = vim.tbl_deep_extend("force", self.options or {}, default_options)
	self.highlights = {}
	for k, v in pairs(self.options.colors) do
		self.highlights[k] = self:create_hl(v, k)
	end
end

function M:update_status()
	local format = vim.bo.fileformat
	if self.options.icons_enabled then
		if self.options.symbols[format] then
			local icon = self.options.symbols[format]
			if self.options.colors_enabled and self.highlights[format] then
				icon = self:format_hl(self.highlights[format]) .. icon
				return icon
			end
			return icon
		end
	else
		return format
	end
end

return M
