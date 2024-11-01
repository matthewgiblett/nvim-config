local icons_status, devicons = pcall(require, "nvim-web-devicons")
if not icons_status then
	return { type = "padding", val = 1 }
end

local path_status, path = pcall(require, "plenary.path")
if not path_status then
	return { type = "padding", val = 1 }
end

local button = require("matthew.utils.button")

local default_mru_ignore = { "gitcommit" }
local mru_opts = {
	ignore = function(ignore_path, ext)
		return (string.find(ignore_path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
	end,
}

local function get_extension(file_name)
	local match = file_name:match("^.+(%..+)$")
	local ext = ""
	if match ~= nil then
		ext = match:sub(2)
	end
	return ext
end

local function icon(fn)
	local ext = get_extension(fn)
	return devicons.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
	short_fn = short_fn or fn
	local ico_txt
	local fb_hl = {}

	local ico, hl = icon(fn)
	local hl_option_type = type(devicons.highlight)
	if hl_option_type == "boolean" then
		if hl and devicons.highlight then
			table.insert(fb_hl, { hl, 0, 1 })
		end
	end
	if hl_option_type == "string" then
		table.insert(fb_hl, { devicons.highlight, 0, 1 })
	end
	ico_txt = ico .. "  "

	local file_button_el = button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
	local fn_start = short_fn:match(".*/")
	if fn_start ~= nil then
		table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt - 2 })
	end
	return file_button_el
end

local mru = function(start, cwd, items_number, opts)
	opts = opts or mru_opts
	items_number = items_number or 9

	local oldfiles = {}
	for _, v in pairs(vim.v.oldfiles) do
		if #oldfiles == items_number then
			break
		end
		local cwd_cond
		if not cwd then
			cwd_cond = true
		else
			cwd_cond = vim.startswith(v, cwd)
		end
		local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
		if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
			oldfiles[#oldfiles + 1] = v
		end
	end

	local special_shortcuts = { "a", "s", "d", "z", "x" }
	local target_width = 35

	local tbl = {}
	for i, fn in ipairs(oldfiles) do
		local short_fn
		if cwd then
			short_fn = vim.fn.fnamemodify(fn, ":.")
		else
			short_fn = vim.fn.fnamemodify(fn, ":~")
		end

		if #short_fn > target_width then
			short_fn = path.new(short_fn):shorten(1, { -2, -1 })
			if #short_fn > target_width then
				short_fn = path.new(short_fn):shorten(1, { -1 })
			end
		end

		local shortcut = ""
		if i <= #special_shortcuts then
			shortcut = special_shortcuts[i]
		else
			shortcut = tostring(i + start - 1 - #special_shortcuts)
		end

		local file_button_el = file_button(fn, " " .. shortcut, short_fn)
		tbl[i] = file_button_el
	end
	return {
		type = "group",
		val = tbl,
		opts = {},
	}
end

return mru
