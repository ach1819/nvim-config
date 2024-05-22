vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Windows
vim.keymap.set("n", "<leader>vsp" , ":vsplit<CR><C-w>w")
vim.keymap.set("n", "<leader>|" , ":vsplit<CR><C-w>w")

vim.keymap.set("n", "<leader>sp" , ":split<CR><C-w>w")
vim.keymap.set("n", "<leader>-" , ":split<CR><C-w>w")
-- End Windows

-- Tabs
vim.keymap.set("n", "<leader>Tn" , ":tabnew<CR>")
vim.keymap.set("n", "<leader>tn" , ":tabnext<CR>")
vim.keymap.set("n", "<leader>tp" , ":tabprevious<CR>")
-- End Tabs

-- Lazy Git
vim.keymap.set("n", "<leader>lg" , ":LazyGit<CR>")

-- Rust Fmt
vim.keymap.set("n", "<leader>rf" , ":RustFmt<CR>")

-- Neogit
vim.keymap.set("n", "<leader>ng" , ":Neogit<CR>")


--vim.api.nvim_set_keymap('n', '<C-_>', ':vertical resize -2<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '=', ':vertical resize +2<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F58>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F57>', ':resize +2<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-_>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-\\>', ':vertical resize -2<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '=', ':vertical resize -2<CR>', { noremap = true, silent = true })
