#import "../lib.typ" : *

#show: report

#import "@preview/muchpdf:0.1.1": muchpdf

#page(
  margin: 0cm
)[
  #muchpdf(
    read("assets/Титульник.pdf", encoding: none),
  )
]
#counter(page).update(3)
#outline()
#pagebreak()

#include "content.typ"

#pagebreak()
#bibliography(
  "bib.yml",
  title: "Список использованных источников",
  full: true,
  style: "gost-r-705-2008-numeric",
)
