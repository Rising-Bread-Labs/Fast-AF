vim.lsp.config('texlab', {
  settings = {
    texlab = {
      build = {
        onSave = true,
        forwardSearchAfter = true, args = { '-pdflua', '-interaction=nonstopmode', '-synctex=1', '%f' },
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
      forwardSearch = {
        executable = 'okular',
        args = { '--unique', 'file:%p#src:%l%f' }
      }
    },
  },
})

vim.lsp.config('clangd', {
  cmd = { '/usr/bin/clangd' }
})
