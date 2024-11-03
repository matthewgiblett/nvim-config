local F = {}

--- @param filename string
function F.get_extension(filename)
	local match = filename:match("^.+(%..+)$")
	local ext = ""
	if match ~= nil then
		ext = match:sub(2)
	end
	return ext
end

--- @param filename string
function F.get_icon(filename)
	local status, devicons = pcall(require, "nvim-web-devicons")
	if not status then
		return "?"
	end
	local extension = F.get_extension(filename)
	return devicons.get_icon(filename, extension, { default = true })
end

function F.echo_table(table)
	vim.api.nvim_echo({
		{ vim.inspect(table) .. "\n" },
	}, true, {})
end

function F.echo_table_pairs(table)
	for k, v in pairs(table) do
		vim.api.nvim_echo({
			{ k .. " : " .. v .. "\n" },
		}, true, {})
	end
end

function F.echo_table_keys(table)
	for k in pairs(table) do
		vim.api.nvim_echo({
			{ k .. "\n" },
		}, true, {})
	end
end

function F.echo_table_values(table)
	for _, v in pairs(table) do
		vim.api.nvim_echo({
			{ v .. "\n" },
		}, true, {})
	end
end

return F
