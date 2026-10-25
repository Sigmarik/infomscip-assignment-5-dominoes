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
      name: "Jane Doe",
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

  show "TODO:": set text(fill: red, weight: "bold")

  show math.equation.where(block: false): box

  grid(columns: (1fr, 1fr),
    [
      #set text(
        size: 14pt,
      )

      #set align(center)

      #heading(numbering: none)[
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

  set heading(numbering: "1.1")

  body
}

#let balance(
  n: 2,
  array,
  renderer,
) = {
  let per-column = calc.ceil(array.len() / n)
  grid(
    columns: (range(n).map(_ => 1fr)),
    ..array.chunks(per-column).map(chunk => {
      for item in chunk {
        renderer(item)
      }
    })
  )
}

#let acknowledgements(
  authors,
) = [
  #set heading(numbering: none)

  = Acknowledgements

  #let authors-with-acks = authors.filter(author => author.acknowledgements != [])
  
  #balance(
    authors-with-acks,
    author => [
      === #author.name (#author.hours-spent hours)
      #author.acknowledgements
    ]
  )
]
