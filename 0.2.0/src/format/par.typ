#import "../global.typ": *

#let par_f(doc) = {
  set par(
    first-line-indent: (
      amount: first_line_indent,
      all: true,
    ),
    justify: true,
    leading: spacing,
    spacing: spacing,
  )



  doc
}
