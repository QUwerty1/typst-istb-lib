#import "src/format/format.typ": format
#import "src/templates/report_title/report_title.typ": report_title
#import "src/utils/utils.typ": *

#let report(doc) = [
  #show: format

  #doc
]