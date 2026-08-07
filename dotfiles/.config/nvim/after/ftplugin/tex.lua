local bufnr = vim.api.nvim_get_current_buf()

local function pythontex_hidden()
  local file_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
  local cmd = 'pythontex ' .. vim.fn.shellescape(file_name)
  vim.fn.jobstart(cmd, {
    ['on_exit'] = function(job_id, data, event)
      vim.cmd('echom "pythontex has finished running with exit status ' .. data ..'."')
    end
  })
end

local function pythontex_terminal()
  local file_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
  local cmd = 'pythontex ' .. vim.fn.shellescape(file_name)
  vim.api.nvim_cmd({cmd = 'terminal', args = {cmd}}, {})
end

vim.api.nvim_buf_create_user_command(bufnr, 'LspPythontexBuildHidden', pythontex_hidden, { desc = 'Build python code from pythontex for current buffer in background' })
vim.api.nvim_buf_create_user_command(bufnr, 'LspPythontexBuildTerminal', pythontex_terminal, { desc = 'Build python code from pythontex for current buffer in terminal buffer' })
vim.keymap.set('n', '<localleader>lph', '<cmd>LspPythontexBuildHidden<cr>', { buffer = true, desc = 'Build python code from pythontex for current buffer in background' })
vim.keymap.set('n', '<localleader>lpt', '<cmd>LspPythontexBuildTerminal<cr>', { buffer = true, desc = 'Build python code from pythontex for current buffer in terminal buffer' })
