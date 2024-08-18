vim.g.mapleader = " "

local keymap = vim.keymap -- shortcut

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>-", "<C-x>")
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<C-j>", ":move +1<CR>")
keymap.set("n", "<C-k>", ":move -2<CR>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "td", ":tabnew<CR>")
keymap.set("n", "tx", ":tabclose<CR>")
keymap.set("n", "tn", ":tabn<CR>")
keymap.set("n", "tp", ":tabp<CR>")

-- plugin vim-maximizer

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- File Tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- FloatTerm

keymap.set("n", "<leader>tt", "<cmd>FloatermNew --disposable<cr>")
