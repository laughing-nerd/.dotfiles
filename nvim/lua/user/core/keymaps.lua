vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Normal mode
keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts) -- Open file explorer
keymap("n", "<leader>l", ":vsplit<cr>", opts)     -- Split window vertically
keymap("n", "<leader>j", ":split<cr>", opts)      -- Split window horizontally
keymap("n", "<leader>n", ":nohl<cr>", opts)       -- Clear highlight
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Visual mode
keymap("v", "<C-h>", "<gv", opts)             -- Indenting in visual mode
keymap("v", "<C-l>", ">gv", opts)             -- Indenting in visual mode
keymap("v", "<C-j>", ":m .+1<CR>gv=gv", opts) -- Move down a line
keymap("v", "<C-k>", ":m .-2<CR>gv=gv", opts) -- Move up a line
keymap("v", "p", '"_dP', opts)                -- Do not reset the yank register

-- Telescope Keymaps
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
