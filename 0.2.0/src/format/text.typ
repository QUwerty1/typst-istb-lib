#import "../global.typ": *

#let text_f(doc) = {
  set text(
    font: "Times New Roman",
    size: font_size,
    lang: "ru",
    hyphenate: false,
    top-edge: "ascender",
    bottom-edge: "descender",
  )

  doc
}
