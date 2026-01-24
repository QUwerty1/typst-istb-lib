#let page_f(doc) = {
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

  doc
}
