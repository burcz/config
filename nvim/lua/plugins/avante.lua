-- Read patterns from your specific .cursorignore file
local function read_ignore_patterns()
  local cursorignore_path = vim.fn.expand("~/Development/XUND/xund-monorepo/.cursorignore")
  local file = io.open(cursorignore_path, "r")
  if not file then
    print("Could not find .cursorignore at: " .. cursorignore_path)
    return {}
  end

  local patterns = {}
  for line in file:lines() do
    line = line:gsub("^%s*(.-)%s*$", "%1") -- trim whitespace
    if line ~= "" and not line:match("^#") then -- skip empty lines and comments
      -- Convert gitignore-style patterns to Lua patterns if needed
      table.insert(patterns, line)
    end
  end
  file:close()
  return patterns
end

return {
  'yetone/avante.nvim',
  branch = 'main',
  run = 'make',
  config = function()
    require('avante_lib').load()
    local config = {
      provider = "openai",
      openai = {
        endpoint = "https://openrouter.ai/api/v1",
        model = "anthropic/claude-3.5-haiku-20241022",
        api_key_name = "OPENROUTER_API_KEY",
      },
      repo_map = {
        ignore_patterns = vim.list_extend(
          { "%.git", "%.worktree", "__pycache__", "node_modules" }, -- defaults
          read_ignore_patterns()
        ),
      },
      mappings = {
        confirm = {
          focus_window = "<C-w>f",
          code = "c",
          resp = "r",
          input = "i",
        },
      },
    }
    local avante = require('avante')
    avante.setup(config)
  end
}

