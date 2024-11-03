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

--- @param start integer? optional default 1
--- @param stop integer? optional default 9
--- @param cwd string? optional current working directory
--- @param opts table? optional
function F.get_most_recent_files(start, stop, cwd, opts)
	local default_mru_ignore = { "gitcommit" }
	local default_opts = {
		ignore = function(ignore_path, ext)
			return (string.find(ignore_path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
		end,
	}
	local files = {}

	start = start or 1
	stop = stop or 9
	opts = opts or default_opts

	for _, v in pairs(vim.v.oldfiles) do
		if #files == stop then
			break
		end

		local is_cwd
		if not cwd then
			is_cwd = true
		else
			is_cwd = vim.startswith(v, cwd)
		end

		local is_readable = vim.fn.filereadable(v) == 1
		local ignore = (opts.ignore and opts.ignore(v, F.get_extension(v))) or false

		if is_cwd and is_readable and not ignore then
			files[#files + 1] = v
		end
	end

	return files
end

return F
