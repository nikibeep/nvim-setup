-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/george/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?.lua;/home/george/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?/init.lua;/home/george/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?.lua;/home/george/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/george/.cache/nvim/packer_hererocks/2.1.1720049189/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["beacon.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\15\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0)\2\0\0'\3\r\0005\4\14\0B\0\4\1K\0\1\0\1\0\1\abg\nwhite\vBeacon\16nvim_set_hl\bapi\bvim\14highlight\1\0\2\fctermbg\3\15\abg\nwhite\18window_events\1\3\0\0\rWinEnter\16FocusGained\18cursor_events\1\2\0\0\16CursorMoved\1\0\t\14highlight\0\fenabled\2\nwidth\3(\rwinblend\3F\bfps\3<\rmin_jump\3\n\nspeed\3\2\18cursor_events\0\18window_events\0\nsetup\vbeacon\frequire\0" },
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/danilamihailov/beacon.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["hlargs.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/george/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\4\0\0\a\0\25\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\r\0005\4\a\0005\5\6\0=\5\b\0045\5\t\0005\6\n\0=\6\v\5=\5\f\4=\4\14\3=\3\15\0025\3\16\0004\4\0\0=\4\17\3=\3\18\0025\3\19\0=\3\20\0025\3\22\0005\4\21\0=\4\23\3=\3\24\2B\0\2\1K\0\1\0\factions\14open_file\1\0\1\14open_file\0\1\0\1\17quit_on_open\1\24update_focused_file\1\0\2\venable\2\15update_cwd\2\ffilters\vcustom\1\0\2\vcustom\0\rdotfiles\1\rrenderer\nicons\1\0\1\nicons\0\vglyphs\bgit\1\0\5\vstaged\b✓\14untracked\b★\fdeleted\t🗑\runstaged\b✗\fignored\b◌\1\0\3\bgit\0\fdefault\t👍\fsymlink\t📥\tshow\1\0\1\vglyphs\0\1\0\4\17folder_arrow\2\bgit\2\tfile\2\vfolder\2\tview\1\0\4\rrenderer\0\ffilters\0\tview\0\24update_focused_file\0\1\0\2\nwidth\3\30\tside\tleft\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\4\0\15\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\14\0B\0\1\1K\0\1\0\tload\16diagnostics\1\0\3\15background\2\14undercurl\2\vdarker\2\15highlights\vcolors\flualine\1\0\1\16transparent\1\15code_style\1\0\5\rkeywords\16bold,italic\14functions\14underline\fstrings\tbold\14variables\tnone\rcomments\vitalic\22toggle_style_list\1\b\0\0\tdark\vdarker\tcool\tdeep\twarm\vwarmer\nlight\1\0\v\25cmp_itemkind_reverse\1\15highlights\0\flualine\0\vcolors\0\15code_style\0\22toggle_style_list\0\16transparent\1\21toggle_style_key\15<leader>ts\nstyle\vdarker\16term_colors\2\18ending_tildes\1\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble" },
    config = { "\27LJ\2\n�\t\0\0\b\0&\0^6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0004\2\0\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\3\0005\2\5\0B\0\2\0016\0\6\0009\0\a\0009\0\b\0005\1\t\0\18\2\0\0'\4\n\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\n\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1\18\2\0\0'\4\n\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1\18\2\0\0'\4\n\0'\5\17\0'\6\18\0\18\a\1\0B\2\5\1\18\2\0\0'\4\n\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1\18\2\0\0'\4\n\0'\5\21\0'\6\22\0\18\a\1\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\n\0'\5\23\0'\6\24\0005\a\25\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\n\0'\5\26\0'\6\27\0005\a\28\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\n\0'\5\29\0'\6\30\0005\a\31\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\n\0'\5 \0'\6!\0005\a\"\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\n\0'\5#\0'\6$\0005\a%\0B\2\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2$<cmd>TroubleToggle quickfix<cr>\15<leader>xq\1\0\2\vsilent\2\fnoremap\2#<cmd>TroubleToggle loclist<cr>\15<leader>xl\1\0\2\vsilent\2\fnoremap\0020<cmd>TroubleToggle document_diagnostics<cr>\15<leader>xd\1\0\2\vsilent\2\fnoremap\0021<cmd>TroubleToggle workspace_diagnostics<cr>\15<leader>xw\1\0\2\vsilent\2\fnoremap\2\27<cmd>TroubleToggle<cr>\15<leader>xx#<cmd>Trouble qflist toggle<cr>\v<C-x>Q$<cmd>Trouble loclist toggle<cr>\v<C-x>L?<cmd>Trouble lsp toggle focus=false win.position=right<cr>\v<C-c>l0<cmd>Trouble symbols toggle focus=false<cr>\v<C-c>s5<cmd>Trouble diagnostics toggle filter.buf=0<cr>\v<C-x>X(<cmd>Trouble diagnostics toggle<cr>\v<C-x>x\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\1\0\a\fpadding\2\ngroup\2\14fold_open\b▾\nicons\2\nsigns\2\16fold_closed\b▸\25use_diagnostic_signs\1\ftrouble\nsetup\fpyright\14lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/george/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimspector = {
    loaded = true,
    path = "/home/george/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: beacon.nvim
time([[Config for beacon.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\15\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0)\2\0\0'\3\r\0005\4\14\0B\0\4\1K\0\1\0\1\0\1\abg\nwhite\vBeacon\16nvim_set_hl\bapi\bvim\14highlight\1\0\2\fctermbg\3\15\abg\nwhite\18window_events\1\3\0\0\rWinEnter\16FocusGained\18cursor_events\1\2\0\0\16CursorMoved\1\0\t\14highlight\0\fenabled\2\nwidth\3(\rwinblend\3F\bfps\3<\rmin_jump\3\n\nspeed\3\2\18cursor_events\0\18window_events\0\nsetup\vbeacon\frequire\0", "config", "beacon.nvim")
time([[Config for beacon.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\4\0\0\a\0\25\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\r\0005\4\a\0005\5\6\0=\5\b\0045\5\t\0005\6\n\0=\6\v\5=\5\f\4=\4\14\3=\3\15\0025\3\16\0004\4\0\0=\4\17\3=\3\18\0025\3\19\0=\3\20\0025\3\22\0005\4\21\0=\4\23\3=\3\24\2B\0\2\1K\0\1\0\factions\14open_file\1\0\1\14open_file\0\1\0\1\17quit_on_open\1\24update_focused_file\1\0\2\venable\2\15update_cwd\2\ffilters\vcustom\1\0\2\vcustom\0\rdotfiles\1\rrenderer\nicons\1\0\1\nicons\0\vglyphs\bgit\1\0\5\vstaged\b✓\14untracked\b★\fdeleted\t🗑\runstaged\b✗\fignored\b◌\1\0\3\bgit\0\fdefault\t👍\fsymlink\t📥\tshow\1\0\1\vglyphs\0\1\0\4\17folder_arrow\2\bgit\2\tfile\2\vfolder\2\tview\1\0\4\rrenderer\0\ffilters\0\tview\0\24update_focused_file\0\1\0\2\nwidth\3\30\tside\tleft\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\4\0\15\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\0025\3\f\0=\3\r\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\14\0B\0\1\1K\0\1\0\tload\16diagnostics\1\0\3\15background\2\14undercurl\2\vdarker\2\15highlights\vcolors\flualine\1\0\1\16transparent\1\15code_style\1\0\5\rkeywords\16bold,italic\14functions\14underline\fstrings\tbold\14variables\tnone\rcomments\vitalic\22toggle_style_list\1\b\0\0\tdark\vdarker\tcool\tdeep\twarm\vwarmer\nlight\1\0\v\25cmp_itemkind_reverse\1\15highlights\0\flualine\0\vcolors\0\15code_style\0\22toggle_style_list\0\16transparent\1\21toggle_style_key\15<leader>ts\nstyle\vdarker\16term_colors\2\18ending_tildes\1\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Trouble', function(cmdargs)
          require('packer.load')({'trouble.nvim'}, { cmd = 'Trouble', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'trouble.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Trouble ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
