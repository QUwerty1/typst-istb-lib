#import "../global.typ": *

#let enum_f(doc) = {
  set enum(
    full: true,
    numbering: (..numbers) => {
      let level = numbers.pos().len()
      let n = numbers.pos().at(level - 1)
      let alphabet = "абвгдежзиклмнопрстуфхцчшщэюя".split("").slice(1, 29)
      if (calc.rem(level, 2) == 0) {
        [#n] + ")"
      } else {
        if (n <= 28) {
          alphabet.at(n - 1) + ")"
        } else {
          alphabet.at(calc.div-euclid(n - 1, 28)) + alphabet.at(calc.rem(n - 1, 28)) + ")"
        }
      }
    },
    indent: first_line_indent,
    number-align: top + start,
  )
  show enum.item: it => {
    list_level.update(l => l + 1)
    set list(indent: 0.1cm, body-indent: 0.1cm)
    it
    list_level.update(l => l - 1)
  }

  show enum: it => context {
    set enum(indent: 0.1cm, body-indent: 0.1cm) if list_level.get() > 1
    it
  }

  doc
}
