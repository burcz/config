 local M = {}

M.search_xund_k8s = function()
    require("telescope.builtin").find_files({
        prompt_title = "< xund-k8s >",
        cwd = "~/Development/XUND/xund-k8s",
        hidden = true,
    })
end

return M
