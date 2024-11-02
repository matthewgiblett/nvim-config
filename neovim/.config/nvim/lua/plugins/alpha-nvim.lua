local alpha = {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	config = function()
		local headers = require("core.headers")
		local get_greeting = require("utils.greeting")
		local button = require("utils.button")
		local get_mru = require("utils.mru")
		local lazy_stats = require("lazy").stats()
		local colours = vim.g.colourscheme_alpha
		local theme = vim.g.colourscheme_name

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
				button("l", "󰒲  Lazy Plugin Manager", "<cmd>Lazy<CR>"),
				button("m", "  Mason Package Manager", "<cmd>Mason<CR>"),
			},
		}

		local key_bindings = {
			type = "group",
			val = {
				{ type = "text", val = " Key Bindings", opts = opts("heading") },
				button("e", "  New File", "<cmd>ene<CR>"),
				button("SPC ee", "  Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),
				button("SPC ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
				button("SPC fs", "  Find Word", "<cmd>Telescope live_grep<CR>"),
				button("SPC wr", "󰦛  Restore Session", "<cmd>SessionRestore<CR>"),
				button("q", "  Quit NVIM", "<cmd>qa<CR>"),
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
					val = { get_mru(1, vim.fn.getcwd(), 5) },
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
