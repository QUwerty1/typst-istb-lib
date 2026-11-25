#import "../global.typ": *

#let list_f(doc) = {
  set list(
    indent: first_line_indent,
    marker: [-]
  )

  show list.item: it => {
    list_level.update(l => l + 1)
    set enum(indent: 0.1cm, body-indent: 0.1cm)
    it
    list_level.update(l => l - 1)
  }

  show list: it => context {
    set list(indent: 0.1cm, body-indent: 0.1cm) if list_level.get() > 1
    it
  }

  doc
}
