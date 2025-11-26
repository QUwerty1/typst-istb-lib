#let styles(doc) = {
  import "@preview/headcount:0.1.0": dependent-numbering, reset-counter

  let leading = 0.47em

  // Настройка текста
  set text(
    font: "Times New Roman",
    size: 14pt,
    lang: "ru",
    hyphenate: false,
  )

  // Настройка страницы
  set page(
    paper: "a4",
    margin: (
      left: 3cm,
      right: 1cm,
      bottom: 2cm,
      top: 1.5cm,
    ),
    numbering: "1",
  )

  // Настройка параграфа
  set par(
    justify: true,
    first-line-indent: (amount: 1.25cm, all: true),
    leading: leading,
  )
  show par: it => block(
    spacing: leading,
    width: 100%,
    it,
  )

  // Настройка заголовков
  set heading(
    numbering: (..nums) => {
      if nums.pos().len() != 1 {
        numbering("1.1", ..nums.pos().slice(1))
      } else {
        h(-0.25cm)
      }
    },
  )
  show heading: it => pad(
    left: {
      if it.level == 1 {
        0cm
      } else {
        1.25cm
      }
    },
    it,
  )
  show heading: it => block(
    width: 100%,
    below: 4pt + leading,
    above: 4pt + leading,
  )[
    #set text(
      size: 14pt,
      weight: "bold",
    )
    #if it.level > 1 [
      #set align(left)
      #it
    ] else [
      #set align(center)

      #it
    ]
  ]

  // Оглавление
  show outline.entry: set block(
    spacing: leading + 1.25pt,
  )

  set outline(
    indent: depth => {
      if depth > 0 {
        (depth - 1) * 0.5cm
      } else {
        0cm
      }
    },
  )

  set outline.entry(
    fill: repeat(gap: 0em, [.]),
  )

  show outline: it => {
    v(leading + 4pt)
    it
  }

  // Настройка изображений
  set figure(
    numbering: dependent-numbering(
      (..nums) => {
        return numbering("1.1", ..nums.pos().slice(1))
      },
      levels: 2,
    ),
  )
  set figure.caption(separator: [ -- ])
  show figure: it => block(
    width: 100%,
    above: 14pt + leading,
    breakable: true,
  )[
    #it
  ]
  show figure.caption: it => block(
    width: 100%,
  )[
    #it \
    #v(-0.7em)
  ]
  show heading: reset-counter(counter(figure.where(kind: image)), levels: 2)

  // Настройка таблиц
  show figure.where(kind: table): set block(
    breakable: true,
  )
  show table: set par(justify: false)

  // Настройка списков
  set enum(
    full: true,
    numbering: (..nums) => {
      let level = nums.pos().len()
      let alphabet = "абвгдежзиклмнопрстуфхцчшщэюя".split("")
      if (calc.rem(level, 2) != 0) {
        [#nums.pos().at(level - 1)] + ")"
      } else {
        alphabet.at(nums.pos().at(level - 1)) + ")"
      }
    },
    indent: 1.25cm,
    number-align: top + start,
  )
  let enum-level = state("enum-level", 1)
  show enum.item: it => {
    enum-level.update(l => l + 1)
    it
    enum-level.update(l => l - 1)
  }

  show enum: it => context {
    set enum(indent: 0.1cm) if enum-level.get() > 1
    it
  }

  // Настройка ссылок

  set ref(
    supplement: none,
  )

  // Настройка raw-текста

  set raw(
    tab-size: 2,
    block: true,
  //   theme: "/resources/raw.tmTheme",
  )

  show raw: it => {
    set block(
      inset: (left: 1.25cm),
    )
    set text(
      font: "Jetbrains Mono",
      size: 12pt,
    )

    it
  }

  // Настройка библиографии
  set bibliography(
    title: "Список использованных источников",
    style: "gost-r-705-2008-numeric",
  )

  show bibliography: set par(
    spacing: leading,
  )

  doc
}
