#import "../../format/format.typ": *

#let report_title(
  institute: [Институт информационных технологий\ и анализа данных им. Е.И. Попова],
  number: [],
  discipline: [],
  title: [],
  variant: [],
  group: [ИСТб-23-1],
  student_name: [],
  teacher_academic_title: [доцент],
  teachers_name: [],
  year: [2025],
  custom_title: none,
) = [
  #show: format
  #set par(justify: false)
  #set page(numbering: none)

  #align(center)[
    Министерство науки и высшего образования Российской Федерации Федеральное государственное бюджетное образовательное учреждение высшего образования

    \

    *ИРКУТСКИЙ НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ\ ТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ*

    \

    #table(
      stroke: none,
      columns: 9.65cm,
      inset: 1pt,

      table.cell(stroke: (bottom: 0.5pt))[
        #institute
      ],
      table.cell()[#text(size: 11.5pt)[
        наименование института
      ]]
    )

    #v(4.5cm)

    #if custom_title == none [
      #table(
        stroke: none,
        columns: 11.97cm,
        inset: 1pt,

        [
          #text(size: 20pt)[*Отчет*]
        ],
        [
          #v(0.2em)
          к лабораторной работе #number по \
          дисциплине "#discipline" \
          "#title"
        ],
        table.cell(stroke: (top: 0.5pt))[
          #text(size: 11.5pt)[наименование темы]
        ],
        [#v(0.5em) Вариант #variant]
      )
    ] else [
      #custom_title
    ]
  ]

  #v(4.75cm)

  #table(
    inset: 1pt,
    stroke: (x, y) => {
      if x in (1, 3, 5) and y in (1, 3) {
        return (top: 0.5pt)
      }
    },
    align: (x, y) => {
      let v = none
      let h = none

      if x == 0 {
        h = left
      } else {
        h = center
      }

      if y in (1, 3) {
        v = top
      } else {
        v = bottom
      }

      return h + v
    },
    columns: (5cm, 3cm, 1cm, 3cm, 1cm, 4cm),
    rows: 0.62cm,

    [Выполнил студент], [#group], [], [], [], [#student_name],

    [], [#text(size: 11.5pt)[шифр]], [], [#text(size: 11.5pt)[подпись]], [], [#text(size: 11.5pt)[И.О. Фамилия]],

    [Проверил], [#teacher_academic_title], [], [], [], [#teachers_name],

    [], [#text(size: 11.5pt)[должность]], [], [#text(size: 11.5pt)[подпись]], [], [#text(size: 11.5pt)[И.О. Фамилия]],

    table.cell(colspan: 2)[Работа защищена с оценкой]
  )

  #v(3.5cm)

  #align(center)[Иркутск #year г.]
]
