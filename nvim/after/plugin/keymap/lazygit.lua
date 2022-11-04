local Remap = require("burcz.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<Leader>lg", function()
    require('lazygit').lazygitcurrentfile()
end)

