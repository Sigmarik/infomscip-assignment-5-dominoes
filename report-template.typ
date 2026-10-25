#let report(
  title: "Report Title",
  assignment-number: 5,
  group: 10,
  authors: (
    (
      name: "John Smith",
      id: "01234567",
      hours-spent: 99,
      acknowledgements: [],
    ),
    (
      name: "John Doe",
      id: "01234567",
      hours-spent: 99,
      acknowledgements: [],
    ),
  ),
  body
) = {
  set page(
    paper: "a4",
    margin: 2.2cm,
  )

  set text(
    size: 12pt,
    lang: "en",
  )

  show figure.caption: set text(size: 0.8em)
  show bibliography: set heading(level: 2)

  grid(columns: (1fr, 1fr),
    [
      #set text(
        size: 14pt,
      )

      #set align(center)

      #heading()[
        MSCIP-#assignment-number\-#group
      ]

      #v(0.5em)

      #title
    ], [
      #set align(right)
      #show: box.with()

      #set text(
        size: 10pt,
        fill: luma(60%),
      )

      #align(left)[
        *Group #group:*
        #for author in authors [
          - #author.name --- #author.id --- #author.hours-spent hours
        ]
      ]
    ]
  )

  body
}

#let acknowledgements(
  authors,
) = [
  == Acknowledgements
  #for author in authors [
    #if author.acknowledgements != [] [
      *#author.name*
      #author.acknowledgements
    ]
  ]
]
