local status, dashboard = pcall(require, "alpha.themes.dashboard")
if not status then
	return { type = "padding", val = 1 }
end

local colours = require("matthew.core.alpha.colours").button

return function(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl = colours.text
	b.opts.hl_shortcut = colours.shortcut
	return b
end
