vim.pack.add({
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/mfussenegger/nvim-jdtls',

  'https://github.com/jay-babu/mason-nvim-dap.nvim',

})

--require('dap').setup({})
--require('jdtls').setup({})

require('mason-nvim-dap').setup({
    ensure_installed = {
      'python',
      'firefox',
      'javadbg',
      'javatest',
    },
    handlers = {
      python = function(config)
        require('mason-nvim-dap').default_setup(config)
      end,
      firefox = function(config)
        require('mason-nvim-dap').default_setup(config)
      end,
    },
})

local config = {
  name = 'jdtls',
  cmd = { 'jdtls' },
  root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),
  settings = {
    java = {
    }
  },
  init_options = {},
}

local bundles = { vim.fn.glob(vim.fn.expand('$MASON/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar')) }
local java_test_bundles = vim.split(vim.fn.glob("$MASON/packages/java-test/extension/server/*.jar"), "\n")
local excluded = {
  "com.microsoft.java.test.runner-jar-with-dependencies.jar",
  "jacocoagent.jar",
}
for _, java_test_jar in ipairs(java_test_bundles) do
  local fname = vim.fn.fnamemodify(java_test_jar, ":t")
  if not vim.tbl_contains(excluded, fname) then
    table.insert(bundles, java_test_jar)
  end
end
config['init_options'] = {
  bundles = bundles,
}
vim.lsp.config('jdtls', config)
