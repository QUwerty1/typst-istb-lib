#let enum_n(
  body,
) = [
  #set enum(
    full: false,
    numbering: "1)",
  )
  #body

]
