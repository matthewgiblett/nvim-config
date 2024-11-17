local utils = require("utils.functions")

local path = vim.fn.stdpath("config") .. "/lua/plugins/colorschemes/*lua"
local files = utils.get_files(path)
local selected_file = utils.random_or_key_metatable(files)[vim.g.colorscheme]

vim.g.colorscheme = "󰨹 Unknown" -- f0a39
local colorschemes = {}
for _, file in pairs(files) do
	local colorscheme = require("plugins.colorschemes." .. file)
	if file == selected_file then
		colorscheme.lazy = false
		colorscheme.enabled = true
		colorscheme.priority = 1000
		vim.g.colorscheme = colorscheme.name
	else
		colorscheme.lazy = true
	end
	table.insert(colorschemes, colorscheme)
end

return colorschemes
