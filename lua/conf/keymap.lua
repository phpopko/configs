local opts = { noremap = true, silent = true }
vim.opt.clipboard = "unnamedplus"
local term_opts = { silent = true }


vim.cmd([[ cabbrev term sp <Bar> term ]])


-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

--keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +1<CR>", opts)
keymap("n", "<C-Down>", ":resize -1<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

keymap("n", "Q", "<nop>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)
keymap("x", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Toggle file tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- (optional) Focus tree if already open
keymap("n", "<leader>E", ":NvimTreeFocus<CR>", { silent = true })

-- (optional) Reveal current file in tree
keymap("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true })

keymap("n", "<C-c>", '"+yy', opts)      -- copy line in normal mode
keymap("v", "<C-c>", '"+y', opts)       -- copy selection in visual mode
keymap("x", "<C-c>", '"+y', opts)       -- copy selection in visual-block mode

keymap("n", "<C-v>", '"+p', opts)       -- paste after cursor in normal mode
keymap("v", "<C-v>", '"+p', opts)       -- paste over selection (will replace)
keymap("x", "<C-v>", '"+p', opts)       -- paste in visual-block mode

keymap("i", "<C-v>", "<C-r>+", opts)    -- paste in insert mode

keymap("t", "<C-w><Esc>", [[<C-\><C-n>]], opts)

