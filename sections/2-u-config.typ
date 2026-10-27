#import "../tiles.typ": *

#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules

#let statement(name: none, body) = thm(supplement: "Statement", name: name, body)

#let dom(body) = [dom(#body)]

= U-Configuration

// Ingredient 2: Show that every Hamiltonian cycle on a board has a U-configuration: two squares
// adjacent in the Hamiltonian cycle where the cycle makes a bend in the same direction. The
// U consists of these two squares plus the two squares adjacent in the Hamiltonian cycle;
// together they form a 2 × 2 square.

#let h-grid(..items) = {
  let cells = items.pos()
  
  box(
    grid(
      columns: cells.len(),
      inset: 5pt,
      ..cells
    )
  )
}

#definition("Delta function")[
  Let $p: {1, 2, ..., n} -> ZZ^2$.
  The _delta function_ $delta_p: ZZ -> ZZ^2$ is defined as
  $delta_p (i) = p^+(i + 1) - p^+(i)$.
]

#corollary[
  If $p: {1, 2, ..., n} -> ZZ^2$ is a path then
  $delta_p [{1, 2, ..., n}] subset {(0, -1), (0, 1), (1, 0), (-1, 0)}$.
]

#definition("Turn Sign")[
  Let $p: {1, 2, ..., n} -> ZZ^2$ be a path and $t in B$. Let $i := H^(-1)(t)$.
  Then $sigma_H (t) = delta_H (i) times delta_H (i - 1)$ is the _turn sign_ of $t$ on $H$.
]

#definition("U-Configuration")[
  $t_1, t_2 in B$ form a _U-configuration_ on a hamiltonian cycle $H: {1, 2, ..., n} -> B$ if
  - $t_1$ and $t_2$ are $H$-adjacent and
  - $sigma_H (t_1) = sigma_H (t_2)$.
]<def:u-configuration>

#h-grid(
  tiles(
    template: (
      ".*",
      ".*",
    ),
    grid-path(
      // stroke: luma(150),
      (0, 0),
      (1, 0),
      (1, 1),
      (0, 1),
    ),
  ),
  tiles(
    template: (
      "*.",
      "*.",
    ),
    grid-path(
      // stroke: luma(150),
      (1, 0),
      (0, 0),
      (0, 1),
      (1, 1),
    ),
  ),
)

#definition[
  Board $B$ is _trivial_ when $|B| <= 2$.
]

#definition("Edge")[
  ${a, b}$ where $a, b in ZZ^2$ is an _edge_ when $a$ and $b$ are adjacent.
]

#tiles(
  template: (
    "..",
  ),
  grid-path(
    stroke: 2pt,
    shift: (-0.5, -0.5),
    (1, 0),
    (1, 1),
  ),
)

#definition[
  Edges $e_1$ and $e_2$ are _adjacent_ if either
  - $|e^1 inter e_2| = 1$ and $e_1 union e_2$ is not contained within one row or one column, or
  - $forall t in e_2 space exists t' in e_1 space t #[and] t' #[are adjacent]$.
]

#definition("Vertex")[
  $v = {a, b, c, d} subset ZZ^2$ is a _vertex_ when $forall x, y, z, w in v$ such that ${x, y}$ and ${z, w}$ are edges
  ${x, y}$ and ${z, w}$ are adjacent.
]

#tiles(
  template: (
    "..",
    "..",
  ),
  grid-path(
    stroke: luma(120),
    shift: (-0.5, -0.5),
    (1, 0),
    (1, 1),
    (1, 2),
  ),
  grid-path(
    stroke: luma(120),
    shift: (-0.5, -0.5),
    (0, 1),
    (1, 1),
    (2, 1),
  ),
  grid-path(
    stroke: 2pt,
    shift: (-0.5, -0.5),
    (1, 1),
  ),
)

#definition[
  Vertices $v_1$ and $v_2$ are _adjacent_ through an edge $e$ if $v_1 inter v_2 = e$.
]

#definition("Vertex graph")[
  _Vertex graph_ of a set of edges $L$ is a graph $G = (V, E)$ where $V$ is the set of all vertices which are adjacent to any other vertex in $Rho(ZZ^2)$ through an edge in $L$ and $E$ is the edge adjacency relation in $V$ over $L$.
]

#definition("Outer boundary")[
  _Outer boundary_ of a board $B$ is the set of all edges $e in Rho(ZZ^2)$ such that $|e inter B| = 1$.
]

#definition[
  $T_p = {t in Rho(ZZ^2): t #[is an edge and] forall a, b in t space a, b #[are not $p$-adjacent]}$ is a _template_ of path $p$.
]

#tiles(
  template:(
    "...",
    "...",
    "...",
  ),
  grid-path(
    (0, 0),
    (1, 0),
    (1, 1),
    (1, 2),
    (2, 2),
  ),
  grid-path(
    stroke: 2pt,
    shift: (-0.5, -0.5),
    (0, 0), (1, 0), (2, 0), (3, 0),
    (3, 1), (3, 2), (3, 3), (2, 3),
    (1, 3), (0, 3), (0, 2), (0, 1),
    (0, 0),
  ),
  grid-path(
    stroke: 2pt,
    shift: (-0.5, -0.5),
    (2, 0), (2, 1), (3, 1),
  ),
  grid-path(
    stroke: 2pt,
    shift: (-0.5, 0.5),
    (2, 0), (2, 1), (3, 1),
  ),
  grid-path(
    stroke: 2pt,
    shift: (-0.5, -0.5),
    (0, 1), (1, 1), (1, 2),
  ),
  grid-path(
    stroke: 2pt,
    shift: (-0.5, 0.5),
    (0, 1), (1, 1), (1, 2),
  ),
)

#statement[
  Let $H$ be a hamiltonian path on a board $B$ and let $T_H$ be a template of $H$.
  Then every loop in the vertex graph of $T_H$ encircles either all of the $B$'s tiles or none of them.
]<stmt:all-or-none>
#proof[
  Assume the opposite that $exists t_1, t_2 in B$ such that $t_1$ is inside the loop and $t_2$ is outside the loop.
  Since $H$ goes through all tiles by definition, there exists a path from $t_1$ to $t_2$ on $H$ that, by definition, does not intersect any edge of $T_H$.
  Therefore $t_1$ and $t_2$ must be on the same side of the loop, which is a contradiction.
]

#statement[
  If $C'$ is a reduction of $C$, then
  $|C'| = 1 => |C| = 2$ and $|C'| = 2 => |C| in {4, 6}$.
]<stmt:reduction-sizes>
#proof[
  Because the $C'$ can be formed only from cells adjacent to cells in $C$, $C$ has to be a cycle in the neighborhood of $C'$.
  Therefore if $|C'| = 1$, $|C| <= 5$. There is only a limited number of cycles of size less than or equal to five which lie within the neighborhood of a single cell.
  In fact, only four such cycles exist which have a length of 2, five cycles with a length of 1 and none with a length of 3 or 4.

  #let nhood-one(..path) = tiles(
    template: (
      " . ",
      ".*.",
      " . ",
    ),
    grid-path(
      stroke: stroke(paint: luma(150), thickness: 2.5pt),
      (1, 1)
    ),
    grid-path(..path.pos()),
  )

  #let nhood-two(..path) = tiles(
    template: (
      " . ",
      ".*.",
      ".*.",
      " . ",
    ),
    grid-path(
      stroke: stroke(paint: luma(150), thickness: 2.5pt),
      (1, 1),
      (1, 2),
    ),
    grid-path(..path.pos()),
  )

  #h-grid(
    nhood-one(
      (1, 1),
    ),
    nhood-one(
      (0, 1),
    ),
    nhood-one(
      (2, 1),
    ),
    nhood-one(
      (1, 0),
    ),
    nhood-one(
      (1, 2),
    ),
  )

  #h-grid(
    nhood-one(
      (1, 1),
      (0, 1),
    ),
    nhood-one(
      (1, 1),
      (2, 1),
    ),
    nhood-one(
      (1, 1),
      (1, 0),
    ),
    nhood-one(
      (1, 1),
      (1, 2),
    ),
  )

  Therefore if $|C'| = 1$, $|C| = 2$.

  If $|C'| = 2$ then the number of cycles of size greater than 2 in the immediate neoghborhood of $C'$ is also very limited.

  #let square(offset) = {
    let (x, y) = offset
    return ((x, y), (x + 1, y), (x + 1, y + 1), (x, y + 1), (x, y))
  }

  #h-grid(
    nhood-two(
      ..square((0, 1))
    ),
    nhood-two(
      ..square((1, 1))
    ),
    nhood-two(
        (0, 1),
        (1, 1),
        (2, 1),
        (2, 2),
        (1, 2),
        (0, 2),
        (0, 1),
    ),
  )

  Therefore if $|C'| = 2$, $|C| in {4, 6}$.
]

#statement[
  Let $B$ be a non-trivial board without holes and with a hamiltonian path $H$.
  Then $exists #[vertex] v subset B$.
]<stmt:contained-vertex>
#proof[
  Because $B$ is hole-free and $H lt.tilde B$ is finite, a sequence $(L_1, L_2, ...)$ of reductions of $H$
  stemming from @def:hole is also finite and its last item $L_m$ has a length of 1.
  
  Because $B$ is non-trivial, $|H| > 2$. Therefore $m > 1$ and,
  because $L_m$ is a reduction of $L_(m - 1)$ and @stmt:reduction-sizes is true, $|L_(m - 1)| = 2$.
  Again, because $B$ is non-trivial and $|L_(m - 1)| = 2 < |B| = |H| = |L_1|$, $m > 2$ and $|L_(m - 2)| in {4, 6}$.

  Therefore $B$ has a cycle of size 4 or 6, either variation of which contain at least one vertex.

  #h-grid(
    tiles(
      template: (
        "..",
        "..",
      ),
      grid-path(
        // stroke: luma(150),
        (0, 0),
        (1, 0),
        (1, 1),
        (0, 1),
        (0, 0),
      ),
      grid-path(
        stroke: 2pt,
        (0.5, 0.5),
      )
    ),
    tiles(
      template: (
        "...",
        "...",
      ),
      grid-path(
        // stroke: luma(150),
        (0, 0),
        (1, 0),
        (2, 0),
        (2, 1),
        (1, 1),
        (0, 1),
        (0, 0),
      ),
      grid-path(
        stroke: 2pt,
        (0.5, 0.5),
      ),
      grid-path(
        stroke: 2pt,
        (1.5, 0.5),
      )
    ),
    tiles(
      template: (
        "..",
        "..",
        "..",
      ),
      grid-path(
        // stroke: luma(150),
        (0, 0),
        (0, 1),
        (0, 2),
        (1, 2),
        (1, 1),
        (1, 0),
        (0, 0),
      ),
      grid-path(
        stroke: 2pt,
        (0.5, 0.5),
      ),
      grid-path(
        stroke: 2pt,
        (0.5, 1.5),
      )
    )
  )
]

#lemma("U-Configuration")[
  Let $B$ be a non-trivial board without holes. Let $H$ be a hamiltonian path on $B$.
  Then there exists a U-configuration on $H$.
]<lem:u-configuration>
#proof[
  Let $v subset B$ be an internal vertex of $B$. By @stmt:contained-vertex, such a vertex exists.

  If $v$ is not part of the vertex graph of $T_H$, every edge around $v$ has been crossed by $H$, meaning that any two adjacent cells of $v$ are a U-configuration.

  #tiles(
    template: (
      "..",
      "..",
    ),
    grid-path(
      (0, 0),
      (1, 0),
      (1, 1),
      (0, 1),
      (0, 0),
    ),
    grid-path(
      stroke: 2pt,
      (0.5, 0.5),
    )
  )

  Lets now examine the situation where $v$ is part of the vertex graph of $T_H$. If $v$ is a leaf it also contains a U-configuration.

  #tiles(
    template: (
      "..",
      "..",
    ),
    grid-path(
      (0, 0),
      (1, 0),
      (1, 1),
      (0, 1),
    ),
    grid-path(
      stroke: 2pt,
      shift: (-0.5, -0.5),
      (0, 1),
      (1, 1),
    )
  )

  If it is not a leaf, then it cannot be a part of any loop as all of its adjacent edges have tiles of $B$ on both sides,
  thus them being in a loop contradicts @stmt:all-or-none.

  #h-grid(
    tiles(
      template: (
        "..",
        "..",
      ),
      grid-path(
        (0, 0),
      ),
      grid-path(
        (1, 0),
        (1, 1),
        (0, 1),
      ),
      grid-path(
        stroke: 2pt,
        shift: (-0.5, -0.5),
        (0, 1),
        (1, 1),
        (1, 0),
      )
    ),
    tiles(
      template: (
        "..",
        "..",
      ),
      grid-path(
        (0, 0),
        (1, 0),
      ),
      grid-path(
        (1, 1),
        (0, 1),
      ),
      grid-path(
        stroke: 2pt,
        shift: (-0.5, -0.5),
        (0, 1),
        (1, 1),
        (2, 1),
      )
    )
  )

  If vertex graph of $T_H$ contains a vertex $v$ which is not in a loop, it contains a dendrite and thus a leaf, which means that it contains a U-configuration.
]
