return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
    require("rose-pine").setup{
      highlight_groups = {
         Comment = { fg = "foam" },
         VertSplit = { fg = "muted", bg = "muted" },
    },
    }
	end
}
