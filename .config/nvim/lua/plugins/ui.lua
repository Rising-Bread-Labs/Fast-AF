vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  'https://github.com/folke/which-key.nvim',
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/folke/todo-comments.nvim',

  'https://github.com/igorlfs/nvim-dap-view',

  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/prichrd/netrw.nvim',
  'https://github.com/karb94/neoscroll.nvim',
  'https://github.com/sphamba/smear-cursor.nvim',
})

require('catppuccin').setup({
  flavour = 'mocha',
  auto_integrations = true,
  integrations = {
    cmp = true,
    notify = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    mason = true,
    dap = true,
    lsp_trouble = true,
    which_key = true,
  },
})
vim.cmd.colorscheme 'catppuccin-nvim'

require('which-key').setup({
  --keys = {
  --  {
  --    '<leader>?',
  --    function()
  --      require('which-key').show({ global = false })
  --    end,
  --    desc = "Buffer Local Keymaps (which-key)",
  --  },
  --},
})

require('notify').setup({})
vim.notify = require('notify')

require('todo-comments').setup({})

require('dap-view').setup({
  winbar = {
    controls = {
      enabled = true,
    },
    sections = {
      'watches', 'scopes', 'exceptions', 'breakpoints', 'threads', 'repl', 'console',
    },
  },
})

require('nvim-web-devicons').setup({})
require('mini.icons').setup({})
require('netrw').setup({})
require('neoscroll').setup({ hide_cursor = false })
require('smear_cursor').setup({})
