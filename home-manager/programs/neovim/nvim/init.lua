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

-- opts

-- -- General / Look & Feel

vim.cmd [[colorscheme elflord]]
vim.opt.syntax = on
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true

-- -- Splitting

vim.opt.splitright = true

-- -- identation / tabs

vim.opt.tabstop = tab_stop
vim.opt.softtabstop = tab_stop
vim.opt.shiftwidth = tab_stop

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- key remaps

-- -- NvimTree stuff
vim.keymap.set('n', '<leader>nt', ":NvimTreeOpen", {})
vim.keymap.set('n', '<leader>ntc', ":NvimTreeClose", {})

-- -- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
