return{
  "norcalli/nvim-colorizer.lua",
  config = function()
    local colorizer = require("colorizer")
    colorizer.setup {
      '*';
      css = { rgb_fn = true; };
      html = { names = true; }
    }
  end
}
