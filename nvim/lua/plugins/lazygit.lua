return {
  "kdheepak/lazygit.nvim",
  keys = {
    {
      "<leader>lg",
      function ()
        require('lazygit').lazygitcurrentfile()
      end,
    },
  }
}
