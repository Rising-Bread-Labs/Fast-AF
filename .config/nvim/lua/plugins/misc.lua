vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/folke/trouble.nvim',
  'https://github.com/vyfor/cord.nvim',
  'https://github.com/akinsho/toggleterm.nvim',
  'https://github.com/tpope/vim-fugitive',
})


require('fzf-lua').setup({})
require('trouble').setup({})
require('cord').setup({})
require('toggleterm').setup({
  open_mapping = [[<c-\>]],
})
