#import "../global.typ": *

#let bibliography_f(doc) = {
  set bibliography(
    title: "Список использованных источников",
    style: "gost-r-705-2008-numeric",
  )

  show bibliography: it => {
    show heading: h => {
      set pad(left: -first_line_indent)

      align(center)[#h]
    }

    it
  }

  doc
}