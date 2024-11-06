local F = require("utils.functions")

local colourscheme_files = F.get_files(vim.fn.stdpath("config") .. "/lua/plugins/colourschemes/*lua")

local selected_colour = F.random_or_key_metatable(colourscheme_files)[vim.g.colourscheme]
vim.g.colourscheme = selected_colour

local colourschemes = {}
for _, file in pairs(colourscheme_files) do
	local colourscheme = require("plugins.colourschemes." .. file)
	if file == selected_colour then
		colourscheme.lazy = false
		colourscheme.enabled = true
		colourscheme.priority = 1000
	else
		colourscheme.lazy = true
	end
	table.insert(colourschemes, colourscheme)
end

return colourschemes
