local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- =========================
-- Clipboard
-- =========================
vim.opt.clipboard = "unnamedplus"

-- =========================
-- Helper for keymaps
-- =========================
local keymap = vim.api.nvim_set_keymap

-- =========================
-- Leader key
-- =========================
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =========================
-- Normal mode keymaps
-- =========================
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Scrolling with centering
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize +1<CR>", opts)
keymap("n", "<C-Down>", ":resize -1<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Disable Ex mode
keymap("n", "Q", "<nop>", opts)

-- =========================
-- Visual mode keymaps
-- =========================
-- Move selected text
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- =========================
-- Visual Block mode
-- =========================
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)
keymap("x", "p", '"_dP', opts)

-- =========================
-- Terminal mode keymaps
-- =========================
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<C-w><Esc>", [[<C-\><C-n>]], opts)

-- =========================
-- NvimTree
-- =========================
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
keymap("n", "<leader>E", ":NvimTreeFocus<CR>", { silent = true })
keymap("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true })

-- =========================
-- Clipboard shortcuts
-- =========================
-- Normal / Visual / Visual-Block
keymap("n", "<C-c>", '"+yy', opts)
keymap("v", "<C-c>", '"+y', opts)
keymap("x", "<C-c>", '"+y', opts)

keymap("n", "<C-v>", [[<Esc>:set paste<CR>"+gP:set nopaste<CR>]], opts)
keymap("i", "<C-v>", [[<Esc>:set paste<CR>"+gP:set nopaste<CR>i]], opts)
keymap("v", "<C-v>", '"+p', opts)

-- Terminal mode clipboard
keymap("t", "<C-c>", [[<C-\><C-N>"+y]], term_opts)
keymap("t", "<C-v>", [[<C-\><C-N>:set paste<CR>"+gP:set nopaste<CR>i]], term_opts)


vim.api.nvim_create_user_command("Term", function()
  vim.cmd("vsplit")                                -- right vertical split
  vim.cmd("lcd /mnt/c/Users/ppopk/prog")          -- fixed folder
  vim.cmd("terminal")                              -- open terminal
  vim.cmd("startinsert")                           -- go to insert mode
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
end, {})

-- split management
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)
keymap("n", "<leader>sc", "<C-w>c", opts)
keymap("n", "<leader>so", "<C-w>o", opts)

-- buffer management
keymap("n", "<leader>bd", ":bdelete<CR>", opts)
keymap("n", "<leader>ba", ":%bd|e#<CR>", opts)

keymap("n", "<leader>d", "yyp", opts)



