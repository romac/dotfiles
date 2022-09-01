require 'paq' {
    'savq/paq-nvim';
    'nvim-treesitter/nvim-treesitter';
    'neovim/nvim-lspconfig';
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-vsnip';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-buffer';
    'simrat39/rust-tools.nvim';
    'hrsh7th/vim-vsnip';

    'w0ng/vim-hybrid';
    'lifepillar/vim-solarized8';
    'cocopon/iceberg.vim';

    'scrooloose/nerdtree';
    'vim-airline/vim-airline';
    'vim-scripts/Align';
    'luochen1990/rainbow';

    'tpope/vim-fugitive';
    'nvim-lualine/lualine.nvim';
}

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

-- General {{{

-- Leader key
vim.mapleader = ","
vim.g.mapleader = ","

-- Local leader key
vim.localleader = "\\"
vim.g.localleader = "\\"

-- Leader key timeout
vim.o.tm = 2000

-- Allow the normal use of "," by pressing it twice
nmap(",,", ",")

-- Disable folds by default
vim.o.foldenable = false

-- Space open/closes folds
nmap("<space>", "za")

-- I can't type
vim.api.nvim_command('command! W :w')

-- Open window splits in various places
nmap('<leader>sh', ':leftabove  vnew<CR>')
nmap('<leader>sl', ':rightbelow vnew<CR>')
nmap('<leader>sk', ':leftabove  new<CR>')
nmap('<leader>sj', ':rightbelow new<CR>')

-- NERDTree
nmap('<leader>f', '<ESC>:NERDTreeToggle<CR>')

-- }}}

require('lualine').setup()

local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
