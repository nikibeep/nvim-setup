-- ~/.config/nvim/lua/floaterm.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- FloaTerm configuration
map('n', '<leader>ft', ':FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish<CR>', opts)
map('n', 't', ':FloatermToggle myfloat<CR>', opts)
map('t', '<Esc>', '<C-\\><C-n>:q<CR>', opts)
