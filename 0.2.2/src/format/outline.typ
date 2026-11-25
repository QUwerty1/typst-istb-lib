#import "../global.typ": *

#let outline_f(doc) = {
  set outline.entry(
    fill: repeat(gap: 0em, [.]),

  )

  show outline: it => {
    show heading: set align(center)
    show heading: pad.with(left: -first_line_indent)

    it
  }

  doc
}
