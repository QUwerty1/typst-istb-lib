/// change orders of cells from
/// 1 4 7
/// 2 5 8
/// 3 6 9
/// to
/// 1 2 3
/// 4 5 6
/// 7 8 9
#let sort_cells(
  content,
) = {
  let tb = ()
  for row in content {
    let new_row = ()
    for cell in row {
      if type(cell) == array {
        new_row.push(cell)
      } else {
        new_row.push((cell,))
      }
    }
    tb.push(new_row)
  }

  let res_table = ()

  for row in tb {
    let row_len = row.len()
    let cell_sizes = ()

    for i in range(0, row_len) {
      cell_sizes.push(0)
    }

    while row.any(cell => cell.len() > 0) {
      let smallest_cell_idx = 0
      let smallest_cell_size = 99999

      for (i, cell_size) in cell_sizes.enumerate() {
        if cell_size < smallest_cell_size {
          smallest_cell_idx = i
          smallest_cell_size = cell_size
        }
      }
      // [#row.at(smallest_cell_idx).first()]

      res_table.push(row.at(smallest_cell_idx).first())
      cell_sizes.at(smallest_cell_idx) += row.at(smallest_cell_idx).first().rowspan
      let a = row.at(smallest_cell_idx).remove(0)
    }
  }
  res_table
}

#let parse_row(
  content,
) = {
  let arrays_row = ()
  for cell in content {
    if type(cell) == array {
      arrays_row.push(cell)
    } else {
      arrays_row.push((cell,))
    }
  }
  let res_row = ()

  let lens = arrays_row.map(cell => cell.len())
  let lcd = 1

  for l in lens {
    lcd = calc.lcm(lcd, l)
  }

  for cell in arrays_row {
    let res_cell = ()
    for el in cell {
      res_cell.push(
        table.cell(
          breakable: false,
          rowspan: calc.div-euclid(lcd, cell.len()),
          el,
        ),
      )
    }
    res_row.push(res_cell)
  }

  res_row
}

#let parse_table(
  content
) = {
  let tb = ()
  for row in content {
    tb.push(parse_row(row))
  }
  
  sort_cells(tb)
}