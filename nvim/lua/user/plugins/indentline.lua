return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local indentline = require("ibl")
    indentline.setup()
  end
}
