return {
  'OXY2DEV/markview.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('markview').setup {
      -- your configuration here
    }
  end,
}
