-- Ensure packer is loaded
vim.cmd [[packadd packer.nvim]]

-- Add the local luarocks path to package.path and package.cpath
local rock_path = '/home/george/.luarocks/share/lua/5.1/?.lua;' ..
                  '/home/george/.luarocks/share/lua/5.1/?/init.lua'
local rock_cpath = '/home/george/.luarocks/lib/lua/5.4/?.so;' ..
                   '/home/george/.luarocks/lib/luarocks/rocks-5.4/?.so'

package.path = package.path .. ';' .. rock_path
package.cpath = package.cpath .. ';' .. rock_cpath


-- Initialize packer and configure plugins
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Install indent-blankline plugin
  use 'lukas-reineke/indent-blankline.nvim'

  -- Install null-ls for additional LSP functionality
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Install impatient.nvim for faster loading
  use 'lewis6991/impatient.nvim'

  -- Install Mason and Mason LSPconfig for managing LSP servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Rust tools setup
  use 'simrat39/rust-tools.nvim'

  -- LSP Configurations
  use 'neovim/nvim-lspconfig'

  -- nvim-cmp and necessary completion plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- Bufferline for managing buffers
  use 'akinsho/bufferline.nvim'

  -- Todo-comments for managing TODOs
  use 'folke/todo-comments.nvim'

  -- Treesitter for enhanced syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'

  -- Treesitter textobjects
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Tagbar for showing code structure (optional)
  use 'preservim/tagbar'

  -- Floaterm for floating terminal (optional)
  use 'voldikss/vim-floaterm'
end)

-- Load impatient (for faster loading)
require('impatient')

-- Additional plugin configurations
require('plug')
require('floaterm')

local lspconfig = require('lspconfig')

-- Mason setup (for managing LSP servers)
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})

require("mason-lspconfig").setup()

-- Rust-tools setup
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- Java LSP Setup with jdtls
local nvim_lsp = require('lspconfig')

-- Define on_attach function for custom behavior when LSP is attached
local function on_attach(client, bufnr)
  -- Example: set buffer-local keybindings for LSP features
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
  -- Add any other customizations here
end

-- LSP handler to enable file watching
vim.lsp.handlers["workspace/didChangeWatchedFiles"] = vim.lsp.with(vim.lsp.handlers["workspace/didChangeWatchedFiles"], { enable = true })

nvim_lsp.jdtls.setup({
    cmd = { vim.fn.stdpath('data') .. '/mason/bin/jdtls' },
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern('.git', 'pom.xml', 'build.gradle', 'settings.gradle'),
    settings = {
        java = {
            home = '/usr/lib/jvm/java-24-openjdk',  -- Ensure this matches your JDK path
        }
    },
    flags = {
      debounce_text_changes = 150,  -- Optional: Adjust debounce time for file watching
  },
  handlers = {
      ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
          -- Custom handling of diagnostics can go here
          vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
      end
  },
})

-- Clangd LSP setup
lspconfig.clangd.setup {
  cmd = { "clangd", "--malloc-trim" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    -- Additional key mappings and setup can be added here
  end,
}

-- nvim-cmp for autocompletion setup
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}

-- LSP Diagnostics Signs and Virtual Text Setup
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '⛔'})
sign({name = 'DiagnosticSignWarn', text = '⚠️'})
sign({name = 'DiagnosticSignHint', text = '💡'})
sign({name = 'DiagnosticSignInfo', text = 'ⓘ'})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- LuaSnip setup for snippets
local luasnip = require'luasnip'

-- Load snippets for LuaSnip (optional, but recommended)
require'luasnip.loaders.from_vscode'.lazy_load()

-- Treesitter configuration for Java
require'nvim-treesitter.configs'.setup {
  ensure_installed = "java",  -- Ensure Java syntax is installed
  highlight = {
    enable = true,  -- Enable syntax highlighting
  },
}

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.g.python3_host_prog = '/usr/bin/python3'

-- Completion Plugin Setup (cmp and vsnip)
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- vim-vsnip for snippets 
    { name = 'calc'},                               -- math calculations
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})

-- Bufferline setup
require('bufferline').setup {
  options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    show_buffer_close_icons = false,
    show_close_icon = true,
    always_show_bufferline = true,
  }
}

-- Null-ls setup for formatting
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.lua_format,
    },
})

-- Todo-comments setup
require('todo-comments').setup {
  highlight = {
    before = "", -- "fg" or "bg" or "fg,bg" or "bg,fg"
    keyword = "wide", -- "fg", "bg", "wide", etc.
    after = "fg", -- "fg" or "bg" or "fg,bg" or "bg,fg"
    pattern = [[\b(KEYWORDS)\b]], -- regex pattern
  },
  colors = {
    TODO = { "fg", "#FF00FF" },
    FIX = { "fg", "#FF0000" },
  }
}

-- Key mappings for Todo-comments
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } }) end, { desc = "Next error/warning todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev({ keywords = { "ERROR", "WARNING" } }) end, { desc = "Previous error/warning todo comment" })

-- Keybindings for formatting
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

-- Tagbar Toggle (Optional)
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })

-- TodoTelescope (Optional)
vim.api.nvim_set_keymap('n', '<leader>td', ':TodoTelescope<CR>', { noremap = true, silent = true })

-- Treesitter setup for better syntax highlighting and more
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "rust", "cpp", "go", "javascript", "typescript" },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
}

-- General Neovim settings for Java development
vim.o.number = true            -- Show line numbers
vim.o.relativenumber = true    -- Show relative line numbers
vim.o.tabstop = 4             -- Set tab width to 4 spaces
vim.o.shiftwidth = 4          -- Set indentation width to 4 spaces
vim.o.expandtab = true        -- Convert tabs to spaces
vim.o.smartindent = true      -- Enable smart indentation
vim.o.wrap = true             -- Enable line wrapping
vim.o.completeopt = "menuone,noselect,noinsert"  -- Autocompletion options
vim.o.showmatch = true        -- Highlight matching parentheses
vim.o.incsearch = true        -- Incremental search
vim.o.ignorecase = true       -- Ignore case in searches
vim.o.smartcase = true        -- Smart case search

-- Enable clipboard support (if necessary)
vim.o.clipboard = "unnamedplus"
