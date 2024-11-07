return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"letieu/harpoon-lualine",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>hm", function()
			harpoon:list():add()
		end, { desc = "Add current file to harpoon" })

		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(1)
		end, { desc = "Select 1st harpoon item" })
		vim.keymap.set("n", "<C-x>", function()
			harpoon:list():select(2)
		end, { desc = "Select 2nd harpoon item" })
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end, { desc = "Select 3rd harpoon item" })
		vim.keymap.set("n", "<C-m>", function()
			harpoon:list():select(4)
		end, { desc = "Select 4th harpoon item" })

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>hh", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
