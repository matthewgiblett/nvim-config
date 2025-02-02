local opt = vim.opt

-- colorscheme and header can be "random" or specific option
-- e.g., "rose-pine" colorscheme or "neovim_ansi_shadow" header
vim.g.colorscheme = "random"
vim.g.header = "random"
vim.g.user_name = "Matt"

vim.g.python3_host_prog = vim.fn.exepath("python3")

opt.guicursor = ""
opt.fillchars = { eob = " " }

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- undo file
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undodir"
opt.undofile = true

-- search
opt.hlsearch = false
opt.incsearch = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "72"
vim.opt.showmode = false

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
opt.isfname:append("@-@")

opt.updatetime = 50
opt.scrolloff = 8

-- security
vim.opt.modelines = 0
