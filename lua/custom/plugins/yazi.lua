return {
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>y',
        function()
          require('yazi').yazi()
        end,
        desc = 'Open Yazi file manager',
      },
    },
    opts = {},
  },
}
