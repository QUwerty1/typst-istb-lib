#let enum_a(
  body,
) = [
  #set enum(
    full: false,
    numbering: n => {
      let alphabet = "абвгдежзиклмнопрстуфхцчшщэюя".split("").slice(1, 29)

      if (n <= 28) {
        alphabet.at(n - 1) + ")"
      } else {
        alphabet.at(calc.div-euclid(n - 1, 28)) + alphabet.at(calc.rem(n - 1, 28)) + ")"
      }
    },
  )
  #body
]
