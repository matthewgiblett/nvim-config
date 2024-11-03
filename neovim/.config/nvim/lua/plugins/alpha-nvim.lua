local alpha = {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	config = function()
		local headers = require("utils.headers")
		local lazy_stats = require("lazy").stats()
		local colours = vim.g.colourscheme_alpha
		local button_hl = colours.button
		local theme = vim.g.colourscheme_name

		local ui = require("utils.ui")
		local get_greeting = ui.get_greeting
		local button = ui.button
		local files_buttons = ui.most_recent_files_buttons

		local opts = function(colour_key)
			return { position = "center", hl = colours[colour_key] }
		end

		math.randomseed(os.time())
		local header = {
			type = "text",
			val = headers["random"],
			opts = opts("primary"),
		}

		local user_name = "Matt"
		local greeting = {
			type = "text",
			val = get_greeting(user_name),
			opts = opts("secondary"),
		}

		local plugins = {
			type = "text",
			val = { "  " .. lazy_stats.count .. " plugins configured" },
			opts = opts("information"),
		}

		local date = {
			type = "text",
			val = { os.date("  %A %d %B") },
			opts = opts("information"),
		}

		local colourscheme = {
			type = "text",
			val = { theme },
			opts = opts("information"),
		}

		local ver = vim.version()
		local version = {
			type = "text",
			val = { "  " .. ver.major .. "." .. ver.minor .. "." .. ver.patch },
			opts = opts("information"),
		}

		local tools = {
			type = "group",
			val = {
				{ type = "text", val = "󱁤 Tools", opts = opts("heading") },
				button("l", "󰒲  Lazy Plugin Manager", "<cmd>Lazy<CR>", button_hl),
				button("m", "  Mason Package Manager", "<cmd>Mason<CR>", button_hl),
			},
		}

		local key_bindings = {
			type = "group",
			val = {
				{ type = "text", val = " Key Bindings", opts = opts("heading") },
				button("e", "  New File", "<cmd>ene<CR>", button_hl),
				button("SPC ee", "  Toggle File Explorer", "<cmd>NvimTreeToggle<CR>", button_hl),
				button("SPC ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>", button_hl),
				button("SPC fs", "  Find Word", "<cmd>Telescope live_grep<CR>", button_hl),
				button("SPC wr", "󰦛  Restore Session", "<cmd>SessionRestore<CR>", button_hl),
				button("q", "  Quit NVIM", "<cmd>qa<CR>", button_hl),
			},
		}

		local recent_files = {
			type = "group",
			val = {
				{
					type = "text",
					val = "󰈢 Recent Files",
					opts = opts("heading"),
				},
				{
					type = "group",
					val = { files_buttons(1, 5, vim.fn.getcwd(), colours.button) },
					opts = { shrink_margin = false },
				},
			},
		}

		local footer = {
			type = "text",
			val = {
				"                                      n e o v i m   ",
				"▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄",
			},
			opts = opts("primary"),
		}

		local padding = function(val)
			return { type = "padding", val = val }
		end

		local layout = {
			padding(1),
			header,
			padding(1),
			greeting,
			plugins,
			date,
			colourscheme,
			version,
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
