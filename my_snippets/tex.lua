local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Inline math with regex prefix
  s({ trig = "(^|[^a-zA-Z])mm", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}${}$", {
      f(function(_, snip) return snip.captures[1] end),
      i(1)
    })
  ),

  -- Display math
  s("[" , fmt("[{}]", { i(1) })),

  -- Fraction
  s({ trig = "(^|[^a-zA-Z])ff", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\frac{{{}}}{{{}}}\\,{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(2), i(0)
    })
  ),

  -- Parentheses
  s("(", fmt("({}){}", { i(1), i(0) })),

  -- Subscript
  s({ trig = "(^|[a-zA-Z ]|[})\\]|'])__", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}_{{{}}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(0)
    })
  ),

  -- Superscript
  s({ trig = "(^|[a-zA-Z ]|[})\\]|'])%%", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}^{{{}}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(0)
    })
  ),

  -- Math symbols
  s("°", t("\\circ")),
  s(":=", t("\\coloneq")),
  s(":-", t("\\colon")),
  s("||", t("\\lvert")),
  s("aa", t("\\forall\\,")),
  s("EE", t("\\exists\\,")),

  -- Infinity
  s({ trig = "(^|[a-zA-Z ]|[})\\]|'])00", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\infty{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(0)
    })
  ),

  -- Roots
  s("sqn", fmt("\\sqrt[{}]{{{}}}{}", { i(1), i(2), i(0) })),
  s("sq2", fmt("\\sqrt{{{}}}{}", { i(1), i(0) })),

  -- Left-right
  s("lr", fmt("\\left {} \\right {}", { i(1), i(0) })),

  -- Dot
  s("++", fmt("\\cdot {}", { i(0) })),

  -- Vector calculus
  s({ trig = "(^|[^a-zA-Z])rot", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\vec{{\\nabla}} \\times {}", {
      f(function(_, snip) return snip.captures[1] end),
      i(0)
    })
  ),
  s({ trig = "(^|[^a-zA-Z])lap", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\nabla^2", {
      f(function(_, snip) return snip.captures[1] end),
    })
  ),
  s({ trig = "(^|[^a-zA-Z])div", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\vec{{\\nabla}} \\cdot {}", {
      f(function(_, snip) return snip.captures[1] end),
      i(0)
    })
  ),

  -- Integrals & sums
  s("int0", t("\\int_0^\\infty ")),
  s("sumi", fmt("\\sum_{{{}}}^{{{}}}{}", { i(1), i(2), i(0) })),
  s("sumj0", t("\\sum_{j=0}^\\infty ")),
  s("sumn0", t("\\sum_{n=0}^\\infty ")),
  s("prodir", t("\\prod_{i=1}^r ")),
  s("prod", fmt("\\prod_{{{}}}^{{{}}}{}", { i(1), i(2), i(0) })),

  -- Derivatives
  s({ trig = "(^|[^a-zA-Z])pa", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\pderiv{{{}}}{{{}}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(2), i(0)
    })
  ),
  s({ trig = "(^|[^a-zA-Z])ppa", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\pderiv[{}]{{{}}}{{{}}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(2), i(3), i(0)
    })
  ),
  s({ trig = "(^|[^a-zA-Z])di", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\deriv{{{}}}{{{}}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(2), i(0)
    })
  ),
  s({ trig = "(^|[^a-zA-Z])ddi", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\deriv[{}]{{{}}}{{{}}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(2), i(3), i(0)
    })
  ),
  s({ trig = "(^|[^a-zA-Z])dd", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\mathrm{d}{{}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(0)
    })
  ),
  -- Vector notation
  s({ trig = "(^|[^a-zA-Z])vv", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\vec{{{}}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(0)
    })
  ),

  -- Overline
  s({ trig = "(^|[^a-zA-Z])oo", regTrig = true, wordTrig = false, trigEngine = "pattern" },
    fmt("{}\\overline{{{}}}{}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1), i(0)
    })
  ),
}

