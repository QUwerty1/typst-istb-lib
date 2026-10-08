#let part(
  body,
  is_pagebreak: true
) = [
  #if is_pagebreak [
    #pagebreak()
  ]
  #align(center)[
    #show heading: pad.with(left: -1.25cm)
    #heading(
      numbering: none,
    )[
      #body
    ]
  ]
  // #context {
  // let ctr = counter(heading).get()
  // ctr.at(0) -= 1
  // counter(heading).update(ctr)
  // }
]
