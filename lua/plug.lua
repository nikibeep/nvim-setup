return require('packer').startup(function()
    -- other plugins...
    use 'lewis6991/impatient.nvim'
    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' 
    use 'simrat39/rust-tools.nvim'

    use 'puremourning/vimspector'
    
    use 'voldikss/vim-floaterm'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'
    use 'nvim-treesitter/nvim-treesitter'

    use 'preservim/tagbar'
    use 'nvim-tree/nvim-web-devicons'

    use 'RRethy/vim-illuminate'

    use 'akinsho/bufferline.nvim'
    
    use { 'm-demare/hlargs.nvim' }
    require('hlargs').setup()

    use {
      'danilamihailov/beacon.nvim',
      config = function()
        require('beacon').setup({
          enabled = true,
          speed = 2,
          width = 40,
          winblend = 70,
          fps = 60,
          min_jump = 10,
          cursor_events = { 'CursorMoved' },
          window_events = { 'WinEnter', 'FocusGained' },
          highlight = { bg = 'white', ctermbg = 15 },
        })
        vim.api.nvim_set_hl(0, 'Beacon', { bg = 'white' })
      end
    }

    use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
    }
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }

    use "lukas-reineke/indent-blankline.nvim"
    require("ibl").setup()

    use {
      'navarasu/onedark.nvim',
      config = function()
          require('onedark').setup {
              style = 'darker', -- Default style
              transparent = false,
              term_colors = true,
              ending_tildes = false,
              cmp_itemkind_reverse = false,
              toggle_style_key = '<leader>ts',
              toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
              code_style = {
                  comments = 'italic',
                  keywords = 'bold,italic',
                  functions = 'underline',
                  strings = 'bold',
                  variables = 'none',
              },
              lualine = {
                  transparent = false,
              },
              colors = {},
              highlights = {},
              diagnostics = {
                  darker = true,
                  undercurl = true,
                  background = true,
              },
          }
          require('onedark').load()
      end
  }


    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
          -- you can configure Hop the way you like here; see :h hop-config
          require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- Integration for external formatters and linters
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use "nvim-lua/plenary.nvim"

    use{
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
    }

    -- Trouble.nvim
    use {
      'folke/trouble.nvim',
      opts = {}, -- Use this section for default options or custom setup
      cmd = "Trouble",
      config = function()
        require('lspconfig').pyright.setup{}
        require('trouble').setup {
          -- Define the list of diagnostics that you want to display
          icons = true, -- Show icons
          fold_open = '▾', -- Icon used for open folds
          fold_closed = '▸', -- Icon used for closed folds
          group = true, -- Group results by file
          padding = true, -- Add padding for the list
          signs = true, -- Show signs in the list
          use_diagnostic_signs = false, -- Use the signs defined by LSP
        }        
        -- Key mappings for Trouble
        local keymap = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        keymap('n', '<C-x>x', '<cmd>Trouble diagnostics toggle<cr>', opts)
        keymap('n', '<C-x>X', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', opts)
        keymap('n', '<C-c>s', '<cmd>Trouble symbols toggle focus=false<cr>', opts)
        keymap('n', '<C-c>l', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', opts)
        keymap('n', '<C-x>L', '<cmd>Trouble loclist toggle<cr>', opts)
        keymap('n', '<C-x>Q', '<cmd>Trouble qflist toggle<cr>', opts)
        vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { noremap = true, silent = true })
      end
    }

      -- File explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- for file icons
      },
      config = function()
        require('nvim-tree').setup {
          -- Your NvimTree configuration here
          view = {
            width = 30, -- Width of the tree
            side = 'left', -- Tree is on the left side
          },
          renderer = {
            icons = {
              show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
              },
              glyphs = {
                default = "👍",
                symlink = "📥",
                git = {
                  unstaged = "✗",
                  staged = "✓",
                  untracked = "★",
                  deleted = "🗑",
                  ignored = "◌",
                },
              },
            },
          },
          filters = {
            dotfiles = false,
            custom = {},
          },
          update_focused_file = {
            enable = true,
            update_cwd = true,
          },
          actions = {
            open_file = {
              quit_on_open = false, -- Keep NvimTree open after opening a file
            },
          },
        }
      end
    }

end)
