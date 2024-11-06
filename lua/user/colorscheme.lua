local M = {
  "catppuccin/nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  -- commit = "18267654c665310c665d3b7c6bc43d5f5ea5e410",
}

-- Check if macOS is in dark mode
local function detectDarkMode()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()

  if result:match("Dark") then
    return "Dark"
  else
    return "Light"
  end
end

function M.config()
  local theme = detectDarkMode()
  if theme == "Dark" then
    vim.cmd.colorscheme "catppuccin-mocha"
  elseif theme == "Light" then
    vim.cmd.colorscheme "catppuccin-latte"
  else
    vim.cmd.colorscheme "catppuccin-mocha"
  end
end

return M
