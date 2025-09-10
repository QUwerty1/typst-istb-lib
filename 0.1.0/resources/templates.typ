#import "@preview/rexllent:0.3.3" : xlsx-parser

// Шаблон рисунка
#let img(
  img, // путь к рисунку
  caption: "", // подпись
  label: <img:default>, // ссылка внутри текста
) = [
  #figure(
    img,
    caption: [
      #caption
    ],
    supplement: "Рисунок",
  ) #label
]

// Шаблон таблицы
#let tab(
  caption: "", // подпись таблицы
  header: (), // заголовок таблицы
  columns: 1, // формат колонок
  text-align: left, // выравнивание текста
  label: <tab:default>, // ссылка внутри текста
  fill: none,
  body, // тело таблицы
) = [
  // счетчик для определения разрыва страницы
  #let rep_count_header = counter("table-rep")
  #let tab_content = (..body,)
  #if header.len() > 0 {
    tab_content = (
      table.header(
        repeat: true,
        ..header.flatten(),
      ),
      body,
    )
  }

  #figure(
    table(
      stroke: {},
      align: (_, y) => {
        if y == 0 { left } else { center }
      },
      inset: (left: 0pt, right: 0pt),
      columns: 1fr,
      table.header(
        repeat: true,
        table.cell(
          inset: 0pt,
          [
            #context {
              rep_count_header.step()
              if rep_count_header.get().first() == 0 [
                #ref(label) -- #caption
              ] else [
                Продолжение
                #ref(label, supplement: "таблицы")
              ]
            }
          ],
        ),
      ),
      [
        #table(
          align: text-align,
          columns: columns,
          fill: fill,
          stroke: 0.5pt,
          ..tab_content.flatten()
        )
      ]
    ),
    supplement: "Таблица",
  ) #label

  #rep_count_header.update(0)
]

#let xlsx_tab(
  path, // ссылка на xlsx файл
  columns: 1, // формат колонок
  label: <tab:default>, // ссылка внутри текста
  caption: "", // подпись таблицы
  text-align: left, // выравнивание текста
  fill: none,
) = [
  // счетчик для определения разрыва страницы
  #let rep_count_header = counter("table-rep")
  #figure(
    table(
      stroke: {},
      align: (_, y) => {
        if y == 0 { left } else { center }
      },
      inset: (left: 0pt, right: 0pt),
      columns: 1fr,
      table.header(
        repeat: true,
        table.cell(
          inset: 0pt,
          [
            #context {
              rep_count_header.step()
              if rep_count_header.get().first() == 0 [
                #ref(label) -- #caption
              ] else [
                Продолжение
                #ref(label, supplement: "таблицы")
              ]
            }
          ],
        ),
      ),
      [
        #xlsx-parser(
          columns: columns,
          align: text-align,
          fill: fill,
          parse-stroke: false,
          parse-alignment: false,
          parse-fill: false,
          path,
          parse-header: true,
          stroke: 0.5pt,
        )
      ]
    ),
    supplement: "Таблица",
  ) #label

  #rep_count_header.update(0)
]