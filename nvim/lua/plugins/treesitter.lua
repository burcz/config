return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
--      ensure_installed = {"javascript", "typescript", "lua"},
      sync_install = false,
      highlight = {
        enable = false,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}
