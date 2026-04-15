#let parse-csv(
  csv,
  columns: auto,
  align: auto,
  stroke: 0.5pt + black
) = {
  set par(justify: false)

  if (columns == auto) {
    columns = csv.first().len()
  }

  let header = csv.first()
  let body = csv.slice(1).flatten()

  table(
    columns: columns,
    align: align,
    stroke: stroke,
    
    table.header(..header),
    ..body
  )
}