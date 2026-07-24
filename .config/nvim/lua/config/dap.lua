local dap = require('dap')

--hook into the jdtls config creation so that we can pass in command line arguments
dap.listeners.on_config.jdtls = function(config)
  if config.type == 'java' then
    local input = vim.fn.input("Program arguments: ")
    if input == "" then return config end
    local final_config = vim.deepcopy(config)
    final_config.args = input
    return final_config
  end
  return config
end
