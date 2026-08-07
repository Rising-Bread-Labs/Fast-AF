-- Make sure to setup `mapleader` and `maplocalleader` before loading
-- and creating other keymaps.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_create_autocmd('PackChanged', { callback = function(event)
  local name, kind = event.data.spec.name, event.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not event.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
  if name == 'cord.nvim' and kind == 'update' then
    if not event.data.active then vim.cmd.packadd('cord.nvim') end
    vim.cmd('Cord update')
  end
end })


-- Required Library
vim.pack.add({'https://github.com/nvim-lua/plenary.nvim'})
require("config.options")

require('plugins.lsp')
require('plugins.dap')
require('plugins.blink')
require('plugins.treesitter')
require('plugins.snip')
require('plugins.lazydev')
require('plugins.ui')
require('plugins.misc')

require("config.keymaps")
require("config.lsp")
require("config.dap")

