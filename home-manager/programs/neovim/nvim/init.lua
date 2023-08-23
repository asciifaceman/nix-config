vim.syntax = on

-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
})

local tab_stop = 2

vim.opt.tabstop = tab_stop
vim.opt.softtabstop = tab_stop
vim.opt.shiftwidth = tab_stop

vim.opt.expandtab = true
vim.opt.autoindent = true
