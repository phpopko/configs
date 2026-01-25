return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then return end

    ts.setup({
      ensure_installed = {
        "c","cpp","python","html","css","matlab","javascript","lua","vim","vimdoc","query"
      },
      sync_install = false,
      auto_install = true,
      autopairs = { enable = true },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
    })
  end,
}
