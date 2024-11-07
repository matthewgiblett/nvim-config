local ui = require("utils.ui")
local f = require("utils.functions")

local padding = function(val)
	return { type = "padding", val = val }
end

local alpha = {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	config = function()
		local colours = require("plugins.colourschemes." .. vim.g.colourscheme)
		local colourscheme_name = colours.name or "?  unknown theme"

		local AlphaHeader = "AlphaHeader"
		local AlphaFooter = "AlphaFooter"
		local AlphaHeading = "AlphaHeading"
		local AlphaHeaderLabel = "AlphaHeaderLabel"

		local button_colours = { text = "AlphaButton", file = "AlphaFile", shortcut = "AlphaShortcut" }

		local heading_tools = {
			type = "text",
			val = "󱁤  Tools",
			opts = { position = "center", hl = AlphaHeading },
		}
		local heading_keys = {
			type = "text",
			val = "  Key Bindings",
			opts = { position = "center", hl = AlphaHeading },
		}
		local heading_files = {
			type = "text",
			val = "󰈢  Recent Files",
			opts = { position = "center", hl = AlphaHeading },
		}

		local plugins_count = 0
		local lazy_ok, lazy = pcall(require, "lazy")
		if lazy_ok then
			plugins_count = lazy.stats().count
		end
		local plugins = "╔═   " .. plugins_count .. " plugins enabled ═╗"
		local len = vim.str_utfindex(plugins)
		local date = f.centre_with_padding("  " .. os.date("%a %d %b"), len, "║")
		local theme_name = f.centre_with_padding(colourscheme_name, len, "╚══", "══╝")

		local header_art = {
			type = "text",
			val = require("utils.headers")[vim.g.header].val,
			opts = { position = "center", hl = AlphaHeader },
		}
		local header_greeting = {
			type = "text",
			val = ui.get_greeting(vim.g.user_name),
			opts = { position = "center", hl = AlphaHeader },
		}
		local header_label = {
			type = "text",
			val = { plugins, date, theme_name },
			opts = { position = "center", hl = AlphaHeaderLabel },
		}

		local tools = {
			type = "group",
			val = {
				heading_tools,
				ui.button("l", "󰒲  Lazy Plugin Manager", "<cmd>Lazy<CR>", button_colours),
				ui.button("m", "  Mason Package Manager", "<cmd>Mason<CR>", button_colours),
			},
		}
		local key_bindings = {
			type = "group",
			val = {
				heading_keys,
				ui.button("e", "  New File", "<cmd>ene<CR>", button_colours),
				ui.button("SPC ee", "  Toggle File Explorer", "<cmd>NvimTreeToggle<CR>", button_colours),
				ui.button("SPC ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>", button_colours),
				ui.button("SPC fs", "  Find Word", "<cmd>Telescope live_grep<CR>", button_colours),
				ui.button("SPC wr", "󰦛  Restore Session", "<cmd>SessionRestore<CR>", button_colours),
				ui.button("q", "  Quit NVIM", "<cmd>qa<CR>", button_colours),
			},
		}
		local recent_files = { type = "group", val = {} }
		local files_buttons = ui.most_recent_files_buttons(1, 5, vim.fn.getcwd(), button_colours)
		if #files_buttons.val > 0 then
			recent_files.val = {
				heading_files,
				files_buttons,
			}
		end
		local v = vim.version()
		local version = "  " .. v.major .. "." .. v.minor .. "." .. v.patch
		local footer = {
			type = "text",
			val = {
				"   " .. version .. "                          n e o v i m   ",
				"▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄",
			},
			opts = { position = "center", hl = AlphaFooter },
		}

		local layout = {
			padding(1),
			header_art,
			padding(1),
			header_greeting,
			header_label,
			padding(1),
			tools,
			padding(1),
			key_bindings,
			padding(1),
			recent_files,
			padding(2),
			footer,
		}

		require("alpha").setup({ layout = layout })

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}

return alpha
