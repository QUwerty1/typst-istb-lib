#import "../global.typ": *

#let list_f(doc) = {
  set list(
    indent: first_line_indent,
  )

  let list-level = state("list-level", 1)
  show list.item: it => {
    list-level.update(l => l + 1)
    it
    list-level.update(l => l - 1)
  }

  show list: it => context {
    set list(indent: 0.1cm) if list-level.get() > 1
    it
  }

  doc
}
