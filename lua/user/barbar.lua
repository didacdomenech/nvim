local M = {
  "romgrk/barbar.nvim",
  event = "BufEnter",
  --commit = "dd852401ee902745b67fc09a83d113b3fe82a96f",
}
M.config = function()
  require("barbar").setup {
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,
    focus_on_close = "left",
    -- more options available at https://github.com/romgrk/barbar.nvim
  }
end
return M
