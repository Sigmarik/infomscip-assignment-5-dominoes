#import "report-template.typ": *
#import "authors.typ": authors

#show: report.with(
  title: "Fundamental Research: Reconfiguring Dominoes on a Square Grid",
  assignment-number: 5,
  group: 10,
  authors: authors,
)

#include("test.typ")

#acknowledgements(authors)

// #bibliography("literature.bib")