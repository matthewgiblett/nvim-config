local function get_file_name(file)
	return file:match("^.+/(.+)%..+$")
end

local function get_files(dir)
	local paths = vim.split(vim.fn.glob(dir), "\n")
	local files = {}
	for _, file in pairs(paths) do
		local key = get_file_name(file)
		files[key] = "plugins.colourschemes." .. key
	end
	return files
end

local function get_keys(t)
	local keys = {}
	for key, _ in pairs(t) do
		table.insert(keys, key)
	end
	return keys
end

local cs_key = vim.g.colourscheme_key
local cs_dir = vim.fn.stdpath("config") .. "/lua/plugins/colourschemes/*lua"
local cs_files = get_files(cs_dir)
local colourschemes = {}

if cs_key == "random" or not vim.tbl_contains(get_keys(cs_files), cs_key) then
	local keys = vim.tbl_keys(cs_files)
	cs_key = keys[math.random(1, #keys)]
end

local i = 0
for key, file in pairs(cs_files) do
	i = i + 1
	local colourscheme = require(file)
	if key == cs_key then
		colourscheme.lazy = false
		colourscheme.enabled = true
		colourscheme.priority = 1000
		vim.g.colourscheme_name = colourscheme.name
		vim.g.colourscheme_alpha = colourscheme.alpha
	else
		colourscheme.lazy = true
	end
	colourschemes[i] = colourscheme
end

return colourschemes
