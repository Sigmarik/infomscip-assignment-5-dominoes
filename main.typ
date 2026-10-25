#import "report-template.typ": *
#import "authors.typ": authors

#show: report.with(
  title: "Fundamental Research: Reconfiguring Dominoes on a Square Grid",
  assignment-number: 5,
  group: 10,
  authors: authors,
)

#include("sections/test.typ")

#include("sections/definitions.typ")
#include("sections/1-hamiltonian-alignment.typ")
#include("sections/2-u-config.typ")
#include("sections/3-adjacent-spaces.typ")
#include("sections/4-domino-reversal.typ")
#include("sections/5-domino-swap.typ")
#include("sections/final.typ")
#include("sections/further-results.typ")

#acknowledgements(authors)

// #bibliography("literature.bib")