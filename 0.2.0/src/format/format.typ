#import "par.typ": par_f
#import "text.typ": text_f
#import "page.typ": page_f
#import "heading.typ": heading_f
#import "outline.typ": outline_f
#import "figure.typ": figure_f
#import "enum.typ": enum_f
#import "bibliography.typ": bibliography_f
#import "list.typ": list_f

#let format(doc) = [
  #show: par_f
  #show: text_f
  #show: page_f
  #show: heading_f
  #show: outline_f
  #show: figure_f
  #show: enum_f
  #show: bibliography_f
  #show: list_f

  #doc
]
