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

return F
