#import "../global.typ": *

#let bibliography_f(doc) = {
  set bibliography(
    title: "Список использованных источников",
    style: "gost-r-705-2008-numeric",
  )

  show bibliography: it => {

    show heading: pad.with(left: -1.25cm)

    show heading: heading => {
      align(center)[#heading]
    }

    it
  }

  doc
}