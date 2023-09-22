local indent_status, indent = pcall(require, "indent_blankline")
if not indent_status then
	return
end

indent.setup({
	char = "▏",
	show_end_of_line = true,
	show_trailing_blankline_indent = false,
	show_current_context = true,
})
