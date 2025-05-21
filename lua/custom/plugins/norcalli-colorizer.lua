return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      '*', -- Enable for all filetypes, or specify like "css", "javascript", etc.
    }, {
      names = true, -- "blue", "red", etc.
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      mode = 'background', -- Use "foreground" or "virtualtext" as alternatives
    })
  end,
}
