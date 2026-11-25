#import "@preview/rexllent:0.4.0": *
#import "@preview/spreet:0.1.0": spreet

#let fig_table(
  body,
  label: <tab:>,
  caption: "",
  breakable: true,
) = [
  #let rep-count-header = counter("table-rep")

  #figure()[
    #table(
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
        repeat: true,
      )[
        #table.cell(inset: 0cm)[
          #context {
            rep-count-header.step()
            if rep-count-header.get().first() == 0 [
              #ref(
                label,
                supplement: "Таблица",
              ) -- #caption
            ] else [
              #ref(
                label,
                supplement: "Продолжение таблицы",
              )
            ]
          }
        ]
      ]
    )[
      #table.cell(inset: 0cm)[
        #body
      ]
    ]
  ] #label

  #rep-count-header.update(0)
]


#let parse_xlsx(
  bytes,
  columns: auto,
) = {
  xlsx-parser(
    bytes,
    parse-stroke: false,
    parse-alignment: false,
    parse-fill: true,
    parse-header: true,
    stroke: 0.5pt,
    columns: columns,
  )
}

#let parse_spreet(
  bytes,
  columns: auto,
) = {
  spreet-parser(
    spreet.decode(bytes),
    parse-stroke: false,
    parse-alignment: false,
    parse-fill: true,
    parse-header: true,
    stroke: 0.5pt,
    columns: columns,
  )
}
