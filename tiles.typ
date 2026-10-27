#let grid-path(
  shift: (0, 0),
  stroke: black,
  fill: white,
  ..points,
) = (
  stroke: stroke,
  fill: fill,
  points: points.pos().map(pnt => (pnt.at(0) + shift.at(0), pnt.at(1) + shift.at(1))),
)

#let tiles(
  template: (" . ", ".R.", " . "),
  cell: 1em,
  ..paths
) = {
  let colors = (
    " ": white,
    ".": silver,
    "*": luma(185),
    "B": blue,
    "R": red,
    "G": green,
    "X": black,
  )
  let strokes = colors.map(color => if color == white {none} else {color.darken(15%)})
  block()[
  #grid(
    rows: range(template.len()).map(_ => cell),
    columns: range(template.at(0).len()).map(_ => cell),
    stroke: none,
    fill: (x, y) => colors.at(template.at(y).at(x)),
  )

  // 2. Gather all cell coordinates
  #let cells = colors.map(_ => ())
  #for y in range(template.len()) {
    for x in range(template.at(0).len()) {
      cells.at(template.at(y).at(x)).push((x, y))
    }
  }
  #cells.insert("", ())

  #let cell-sequence = " .*GRBX".split("").map(char => cells.at(char)).join()
  #for pair in cell-sequence {
    let (x, y) = pair
    let s-color = strokes.at(template.at(y).at(x))
    if s-color != none {
      place(
        top + left,
        dx: cell * x,
        dy: cell * y,
        rect(
          width: cell,
          height: cell,
          stroke: s-color,
        )
      )
    }
  }
  #let radius = 0.1em
  #for pth in paths.pos() {
    let path-points = pth.points
    let stroke = pth.stroke
    let fill = pth.fill
    for idx in range(path-points.len() - 1) {
      let (x1, y1) = path-points.at(idx)
      let (x2, y2) = path-points.at(idx + 1)
      place(
        top + left,
        line(
          stroke: stroke,
          start: (cell / 2 + cell * x1, cell / 2 + cell * y1),
          end: (cell / 2 + cell * x2, cell / 2 + cell * y2),
        ),
      )
    }
    for (x, y) in path-points {
      place(
        top + left,
        dx: cell / 2 + cell * x - radius,
        dy: cell / 2 + cell * y - radius,
        circle(fill: fill, stroke: stroke, radius: radius),
      )
    }
  }
  ]
}