----------Terminal Stuff---------------
vim.keymap.set('t', '<C-space>', '<C-\\><C-n>', {silent = true})
vim.api.nvim_create_user_command('LazyGit', '1TermExec cmd="lazygit" dir=git_dir go_back=0', {})

----------LuaSnip Keybinds-------------
local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand({}) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})


----------Trouble Diagnostics----------
vim.keymap.set(
  {'n'},
  '<leader>tf',
  function()
    local opts = vim.diagnostic.config()
    if opts ~= nil then
      vim.diagnostic.config({
        virtual_text = not opts.virtual_text,
        underline = not opts.underline,
      })
    end
  end,
  { desc = "Toggle In-Buffer Diagnostics" }
)
vim.keymap.set(
  {'n'},
  '<leader>tt',
  '<cmd>Trouble diagnostics toggle<cr>',
  { desc = 'Diagnostics (Trouble)' }
)
vim.keymap.set(
  {'n'},
  '<leader>tT',
  '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  { desc = 'Buffer Diagnostics (Trouble)' }
)
vim.keymap.set(
  {'n'},
  '<leader>ts',
  '<cmd>Trouble symbols toggle focus=false win.position=right win.size = 0.25<cr>',
  { desc = 'Symbols (Trouble)' }
)
vim.keymap.set(
  {'n'},
  '<leader>tl',
  '<cmd>Trouble lsp toggle focus=false win.position=right win.size=0.3<cr>',
  { desc = 'LSP Definitions / references / ... (Trouble)' }
)
vim.keymap.set(
  {'n'},
  '<leader>tL',
  '<cmd>Trouble loclist toggle<cr>',
  { desc = 'Location List (Trouble)' }
)
vim.keymap.set(
  {'n'},
  '<leader>tQ',
  '<cmd>Trouble qflist toggle<cr>',
  { desc = 'Quickfix List (Trouble)' }
)

vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {desc = "Code Action"});

---------------DAP & DapView-----------------
local dap = require('dap')
local dv = require('dap-view')
local jdtls = require('jdtls')

vim.keymap.set({'n'}, '<leader>db', function() dap.toggle_breakpoint() end, {silent = true, desc = 'Toggle Breakpoint'})
vim.keymap.set({'n'}, '<leader>dc', function() dap.continue() end, {silent = true, desc = 'Continue'})
vim.keymap.set({'n'}, '<leader>djc', function() jdtls.compile("incremental") end, {silent = true, desc = 'Compile Java Classes'})

vim.keymap.set({'n'}, '<leader>dv', function() dv.toggle() end, {silent = true, desc = 'Toggle View'})
vim.keymap.set({'n'}, '<leader>dw', '<cmd>DapViewWatch<cr>', {silent = true, desc = 'Watch'})


