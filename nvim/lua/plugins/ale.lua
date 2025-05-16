return {
    'dense-analysis/ale',
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_linters = {
            javascript = {'prettier', 'eslint'},
            typescript = {'prettier', 'eslint'}
        }
        g.ale_fixers= {
            javascript = {'prettier', 'eslint'},
            typescript = {'prettier', 'eslint'}
        }
        g.ale_disable_lsp = 1
    end
}
