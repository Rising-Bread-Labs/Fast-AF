vim.pack.add({
  'https://github.com/L3MON4D3/LuaSnip',
})
require('luasnip').setup({})
vim.fn.jobstart({'make', '-C', vim.pack.get({'LuaSnip'})[1].path, 'install_jsregexp'}, {
  on_exit = function(job_id, exit_code, event)
    if exit_code == 0 then
      --print('Built jsregexp for LuaSnip')
    else
      print('Could not build jsregexp for LuaSnip')
    end
  end,
})
require('luasnip.loaders.from_vscode').lazy_load()
