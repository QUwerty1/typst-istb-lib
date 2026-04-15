#import "@preview/headcount:0.1.0": dependent-numbering, reset-counter

#let figure_f(doc) = {
  set figure(
    numbering: dependent-numbering(
      "1.1",
      levels: 1,
    ),
  )

  show figure.where(kind: image): set block(
    breakable: true,
  )

  set figure.caption(
    separator: [ -- ],
  )

  // figure - image

  show figure.where(kind: image): set figure(
    supplement: "Рисунок",
  )

  show heading: reset-counter(
    counter(figure.where(kind: image)),
  )

  // figure - table

  show figure.where(kind: table): it => {
    let rep-count-header = counter("table-rep")

    show figure: set block(
      breakable: true,
    )

    set table.header(
      repeat: true
    )

    figure(
      kind: "figure-table",
      supplement: "Таблица",

      table(
        stroke: {},
        columns: 1fr,
        align: (_, y) => {
          if y == 0 {
            left + bottom
          } else {
            center
          }
        },
        inset: 0cm,

        table.header(
          context {
            rep-count-header.step()
            if rep-count-header.get().first() == 0 [
              #it.caption
            ] else [
              Продолжение таблицы
              #numbering(
                it.numbering,
                ..counter(figure.where(kind: table)).get(),
              )
            ]
          }
        )
      )[
        #table.cell(inset: 0cm)[
          #it.body
        ]
      ],
    )

    rep-count-header.update(0)
  }

  show heading: reset-counter(
    counter(figure.where(kind: table)),
  )

  doc
}
