#import "@preview/headcount:0.1.0": dependent-numbering, reset-counter

#let figure_f(doc) = {
  set figure(
    numbering: dependent-numbering(
      "1.1",
      levels: 1,
    ),
    supplement: "Рисунок",
  )
  set figure.caption(separator: [ -- ])
  show figure: set block(breakable: true)

  show heading: reset-counter(
    counter(figure.where(kind: image)),
  )

  doc
}
