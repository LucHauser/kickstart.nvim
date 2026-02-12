local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('tex', {

  -- \begin{} \end{}
  s('beg', {
    t '\\begin{',
    i(1, 'environment'),
    t { '}', '' },
    t '\\end{',
    i(1),
    t '}',
  }),

  -- inline math
  s('mm', {
    t '$',
    i(1),
    t '$',
  }),

  -- display math
  s('dm', {
    t { '\\[', '' },
    i(1),
    t { '', '\\]' },
  }),

  -- fraction
  s('ff', {
    t '\\frac{',
    i(1, 'numerator'),
    t '}{',
    i(2, 'denominator'),
    t '}',
  }),

  -- figure environment
  s('fig', {
    t { '\\begin{figure}[ht]', '  \\centering', '  \\includegraphics[width=\\textwidth]{' },
    i(1, 'file'),
    t { '}', '  \\caption{' },
    i(2, 'caption'),
    t { '}', '  \\label{fig:' },
    i(3, 'label'),
    t { '}', '\\end{figure}' },
  }),
})
