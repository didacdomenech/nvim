local M = {
  "catppuccin/nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "catppuccin"
function M.config()

  -- # day/night theme checker #
  local current_hour = tonumber(os.date("%H"))

  if current_hour >= 6 and current_hour < 18 then
    FLAVOUR = "mocha"
  else
    FLAVOUR = "mocha"
  end

  require("catppuccin").setup({
    flavour = FLAVOUR
  })

  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end

end

return M
