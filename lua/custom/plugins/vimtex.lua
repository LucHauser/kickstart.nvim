return {
  'lervag/vimtex',
  ft = { 'tex' },
  init = function()
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = { continuous = 1 }

    -- Use comma as VimTeX leader instead of backslash
    vim.g.maplocalleader = ','

    -- PDF viewer
    if vim.fn.has 'mac' == 1 then
      vim.g.vimtex_view_method = 'skim'
    elseif vim.fn.has 'win32' == 1 then
      vim.g.vimtex_view_general_viewer = 'SumatraPDF'
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    end
  end,
}
