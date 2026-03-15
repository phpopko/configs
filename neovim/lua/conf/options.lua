local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  ro = false,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  cursorline = false,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 4,
  sidescrolloff = 4,
  guifont = "JetBrainsMono_Nerd_Font:h11",
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Filetype indentation
vim.api.nvim_create_augroup("FileTypeSpecific", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "javascript", "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
  group = "FileTypeSpecific",
})

-- Formatting behavior
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.opt.shortmess:append("c")
