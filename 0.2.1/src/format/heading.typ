#import "../global.typ": *

#let heading_f(doc) = {
  set heading(
    numbering: (..nums) => {
      numbering("1.1", ..nums.pos())
    },
  )

  show heading: set text(
    size: font_size,
  )

  show heading: set block(
    above: 4pt + spacing,
    below: 4pt + spacing,
  )

  show heading: pad.with(left: first_line_indent)

  doc
}
