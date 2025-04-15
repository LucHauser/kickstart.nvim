-- markdown preview plugin: https://github.com/iamcco/markdown-preview.nvim
return {
  'iamcco/markdown-preview.nvim',
  ft = { 'markdown' },
  build = 'cd app && npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_auto_start = 1
  end,
}
