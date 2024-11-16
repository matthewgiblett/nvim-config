local funcs = require("utils.functions")
local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require({
	utils = "lualine.utils.utils",
	highlight = "lualine.highlight",
})
local utils = require("lualine.utils")

local M = lualine_require.require("lualine.component"):extend()

local default_options = {
	status_symbols = {
		modified = "󱇧", -- f11e7
		readonly = "󰈡", -- f0221
		unnamed = "󰱼", -- f0c7c
		newfile = "󰝒", -- f0752
	},
	colors = {
		modified = {
			scope = { "fg" },
			syntaxlist = { "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
			default = "#e32636",
		},
		readonly = {
			scope = { "fg" },
			syntaxlist = { "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffChange" },
			default = "#273faf",
		},
		newfile = {
			scope = { "fg" },
			syntaxlist = { "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "Normal" },
			default = "#ffffff",
		},
		unnamed = {
			scope = { "fg" },
			syntaxlist = { "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
			default = "#ffa500",
		},
	},
}

local function is_new_file()
	local filename = vim.fn.expand("%")
	return filename ~= "" and vim.bo.buftype == "" and vim.fn.filereadable(filename) == 0
end

function M:init(options)
	M.super.init(self, options)
	self.options = utils.apply_default_colors(self.options, default_options)
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
	self.highlights = {}
	for k, v in pairs(self.options.colors) do
		self.highlights[k] = self:create_hl(v, k)
	end
	self.icon_hl_cache = {}
end

function M:update_status()
	local filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
	local len = 30
	local display = #filename < len and filename or vim.trim(filename:sub(1, len)) .. ""
	local file_status = {
		unnamed = not filename or filename == "",
		modified = vim.bo.modified,
		readonly = vim.bo.modifiable == false or vim.bo.readonly == true,
		newfile = is_new_file(),
	}

	local result = {}
	for k, v in pairs(file_status) do
		if v then
			local icon = self.options.status_symbols[k]
			if self.highlights[k] then
				icon = self:format_hl(self.highlights[k]) .. icon
			end
			table.insert(result, icon)
		end
	end

	if #result == 0 then
		return display
	end
	local status = table.concat(result, " ")
	if not display or display == "" then
		return status
	end
	return display .. " " .. status
end

function M:apply_icon()
	local filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
	local icon, icon_highlight_group = funcs.get_icon(filename, false)
	if icon == nil then
		return
	end
	if icon_highlight_group == nil then
		icon_highlight_group = "DevIconDefault"
	end
	local highlight_color = modules.utils.extract_highlight_colors(icon_highlight_group, "fg")
	if highlight_color then
		local icon_highlight = self.icon_hl_cache[highlight_color]
		if not icon_highlight or not modules.highlight.highlight_exists(icon_highlight.name .. "_normal") then
			icon_highlight = self:create_hl({ fg = highlight_color }, icon_highlight_group)
			self.icon_hl_cache[highlight_color] = icon_highlight
		end

		icon = self:format_hl(icon_highlight) .. icon .. self:get_default_hl()
	end
	self.status = icon .. " " .. self.status
end

return M
