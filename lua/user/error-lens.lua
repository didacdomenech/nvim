local M = {
  "chikko80/error-lens.nvim",
  event = "BufRead",
  dependencies = { "nvim-telescope/telescope.nvim" }
}
M.config = function()
  require("error-lens").setup {
    enabled = true,
    auto_adjust = {
      enable = false,
      fallback_bg_color = nil, -- mandatory if enable true (e.g. #281478)
      step = 7, -- inc: colors should be brighter/darker
      total = 30 -- steps of blender
    },
    prefix = 4, -- distance code <-> diagnostic message
    -- default colors
    colors = {
      error_fg = "#FF6363", -- diagnostic font color
      error_bg = "#4B252C", -- diagnostic line color
      warn_fg = "#FA973A",
      warn_bg = "#403733",
      info_fg = "#5B38E8",
      info_bg = "#281478",
      hint_fg = "#25E64B",
      hint_bg = "#147828"
    }
  }
end
return M
