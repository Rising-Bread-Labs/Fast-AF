vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/R-nvim/R.nvim',
})

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'jdtls',
    'lua_ls',
    'pylsp',
    'rust_analyzer',
    'texlab',
    'vtsls',
    },
})

require('r').setup({})
