local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  commit = "703ec63aa798e5e07d309b35e42def34bebe0174",
}
M.config = function()
  require("nvim-surround").setup({})
end
return M
