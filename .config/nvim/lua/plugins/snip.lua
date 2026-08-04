vim.pack.add({
  'https://github.com/L3MON4D3/LuaSnip',
})
require('luasnip').setup({})
-- Only run make if jsregexp hasn't been built yet
local luasnip_path = vim.pack.get({'LuaSnip'})[1].path
local jsregexp_so = luasnip_path .. '/deps/jsregexp/jsregexp.so'

if vim.fn.filereadable(jsregexp_so) == 0 then
  vim.fn.jobstart({'make', '-C', luasnip_path, 'install_jsregexp'})
end
require('luasnip.loaders.from_vscode').lazy_load()
