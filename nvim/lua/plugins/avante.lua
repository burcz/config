return {
  'yetone/avante.nvim',
  branch = 'main',
  run = 'make',
  config = function()
    require('avante_lib').load()
    local config = {
      windows = {
        input = {
          border = "rounded",
          width = 60,
          height = 10,
        },
        output = {
          border = "rounded",
          width = 60,
          height = 20,
        },
        ask = {
          floating = true,
          border = "rounded",
          start_insert = true
        }
      }
    }
    local avante = require('avante')
    avante.setup(config)
  end
}
