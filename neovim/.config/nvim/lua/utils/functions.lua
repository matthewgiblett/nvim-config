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

return F
