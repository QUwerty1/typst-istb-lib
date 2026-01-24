#import "@preview/headcount:0.1.0": dependent-numbering, reset-counter

#let figure_f(doc) = {
  set figure(
    numbering: dependent-numbering(
      (..numbers) => {
        let numbers_arr = numbers.pos()
        numbers_arr.remove(1)

        return numbering("1.1", ..numbers_arr)
      },
      levels: 2,
    ),
    supplement: "Рисунок",
  )
  set figure.caption(separator: [ -- ])
  show figure: set block(breakable: true)


  doc
}
