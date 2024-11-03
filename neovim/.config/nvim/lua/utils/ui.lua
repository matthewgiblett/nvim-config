local functions = require("utils.functions")

local F = {}

--- @param name string
function F.get_greeting(name)
	local index
	local greetings = {
		[1] = "  Sleep well",
		[2] = "  Good morning",
		[3] = "  Good afternoon",
		[4] = "  Good evening",
		[5] = "  Good night",
	}
	local hour = os.date("*t").hour
	if hour == 23 or hour < 7 then
		index = 1
	elseif hour < 12 then
		index = 2
	elseif hour >= 12 and hour < 18 then
		index = 3
	elseif hour >= 18 and hour < 21 then
		index = 4
	elseif hour >= 21 then
		index = 5
	end
	return greetings[index] .. ", " .. name
end

--- @param shortcut string
--- @param text string
--- @param keybind string? optional
--- @param keybind_opts table? optional
--- @param highlight_opts table? optional settings: {text, shortcut}
function F.button(shortcut, text, keybind, keybind_opts, highlight_opts)
	local sub_shortcut = shortcut:gsub("%s", ""):gsub("SPC", "<leader>")

	-- Default highlight settings
	highlight_opts = highlight_opts or {}
	local hl_text = highlight_opts.text or "String"
	local hl_shortcut = highlight_opts.shortcut or "Keyword"

	local opts = {
		position = "center",
		cursor = 3,
		width = 50,
		align_shortcut = "right",
		hl = hl_text,
		hl_shortcut = hl_shortcut,
	}
	opts.shortcut = shortcut

	if keybind then
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sub_shortcut, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sub_shortcut .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = text,
		on_press = on_press,
		opts = opts,
	}
end

--- @param filename string
--- @param shortcut string
--- @param short_filename string? optional
--- @param highlight_opts table? optional settings: {text, file, shortcut}
function F.file_button(filename, shortcut, short_filename, highlight_opts)
	short_filename = short_filename or filename

	-- Default highlight settings
	highlight_opts = highlight_opts or {}
	local hl_text = highlight_opts.text or "String"
	local hl_file = highlight_opts.file or "Error"
	local hl_shortcut = highlight_opts.shortcut or "Keyword"

	local parent_directory = short_filename:match(".*[/\\]")
	local icon, hl = functions.get_icon(filename)
	local text = icon .. "  " .. short_filename

	local highlights = {}
	table.insert(highlights, { hl_text, 0, #text })
	if hl then
		table.insert(highlights, { hl, 0, #icon })
	end
	if parent_directory ~= nil then
		table.insert(highlights, { hl_file, #text - #short_filename + #parent_directory, #text })
	end

	local keybind_opts = {}
	local button_hl_opts = {
		text = highlights,
		shortcut = hl_shortcut,
	}
	local button =
		F.button(shortcut, text, "<cmd>e " .. vim.fn.fnameescape(filename) .. " <CR>", keybind_opts, button_hl_opts)

	return button
end

--- @param start integer? optional default 1
--- @param stop integer? optional default 9
--- @param cwd string? optional current working directory
--- @param highlight_opts table? optional settings: {text, file, shortcut}
function F.most_recent_files_buttons(start, stop, cwd, highlight_opts)
	local path_status, path = pcall(require, "plenary.path")
	local shortcuts = { "a", "s", "d", "z", "x" }
	local max_file_chars = 35

	local buttons = {}
	local files = functions.get_most_recent_files(start, stop, cwd)
	for index, filename in ipairs(files) do
		local short_filename
		if cwd then
			short_filename = vim.fn.fnamemodify(filename, ":.")
		else
			short_filename = vim.fn.fnamemodify(filename, ":~")
		end

		while #short_filename > max_file_chars and path_status do
			short_filename = path.new(short_filename):shorten(1, { -2, -1 })
		end

		local shortcut = ""
		if index <= #shortcuts then
			shortcut = shortcuts[index]
		else
			shortcut = tostring(index + start - 1 - #shortcuts)
		end

		local button = F.file_button(filename, " " .. shortcut, short_filename, highlight_opts)
		buttons[index] = button
	end

	return {
		type = "group",
		val = buttons,
		opts = {},
	}
end

return F
