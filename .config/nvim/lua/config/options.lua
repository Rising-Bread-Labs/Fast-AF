-- set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- insert spaces instead of \t
vim.opt.expandtab = true

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- enable advanced color in TUI
vim.opt.termguicolors = true

-- enable vim diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})

-- enable the clipboard
vim.opt.clipboard = 'unnamedplus'
