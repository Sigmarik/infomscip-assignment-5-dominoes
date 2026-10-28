#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules
#import "../tiles.typ": *

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


= Hamiltonian Cycle

// Ingredient 1: Show that for a Hamiltonian cycle on a board as specified, no matter how the
// n dominoes start, they can always be moved onto the cycle. That is, they each cover two
// squares that are adjacent in the cycle.

#definition("Hamiltonian Cycle")[
  A _Hamiltonian cycle_ is a track that passes through every square once and comes back to the start.
]<def:hamiltonian-cycle>

#lemma("Ingredients")[
  Ingredient 1: Show that for a Hamiltonian cycle on a board as specified, no matter how the $n$ dominoes start, they can always be moved onto the cycle. That is, they each cover two   squares that are adjacent in the cycle.
]<lem:ingredients-1>

#proof()[
  Set a final desired Hamiltonian cycle $H$, in the order $H_1$, $H_2$, …, $H_{2n+1}$, $H_{2n+2}$, where each $H_{i+1}$ follows $H_i$ in the cycle, with $i+1 = 1$ for $i = 2n+2$, to close the cycle. \
  Call the empty squares $E_1$ and $E_2$.

  Step 1 \
  Determine dominos not $H$, that is, dominos who aren't laying on $[H_i, H_i+1]$, with sharing their borders. Call the number of dominos not on $H$, $k$. \\

  Step 2. \
  If k > 0: \
  #h(20pt) Let location of $E_1$ be $H_i$: \
   - if $H_i+1$  has one half of a domino r, so that the location of $r = [H_i+1, H_j]$, move that domino r to the place of $E_1$ using either a straight slide or a 90 degree turn, so the domino ends up $[H_i, H_i+1]$. If $j$ was not $i+2$, (i.e., $r$ was not on $H$), subtract 1 from k. Move $E_1$ to $H_j$.


  #h-grid(
  tiles(
    template: (
      "....",
      "....",
    ),
    grid-path(
      stroke:oklch(50%, 0.229, 28.76deg, 20%),
      (0,0),
      (3,0),
      (3,1),
      (0,1),
      (0,0),
    ),
    grid-path(
      (1,1),
      (1,0)

    ),
    grid-path(
      (2,1),
      (3,1)
    ),
    grid-path(
      (2,0),
      (3,0)
    ),
  ),
  tiles(
    template: (
      "....",
      "....",
    ),
    grid-path(
      stroke:oklch(50%, 0.229, 28.76deg, 20%),
      (0,0),
      (3,0),
      (3,1),
      (0,1),
      (0,0),
    ),
    grid-path(
      (0,1),
      (1,1)

    ),
    grid-path(
      (2,1),
      (3,1)
    ),
    grid-path(
      (2,0),
      (3,0)
    ),
  ),
)
#align(left)[
  #text(size: 9pt)[
    #emph[Red line represents a hamiltonian cycle, and the black lines are dominoes.]
  ]
]

   - if $H_i+1$  is however occupied by $E_2$, leave $E_1$ at $H_i$ and continue step 2 with $E_2$ and swap the labels for the empty squares.

  Step 3. \ 
  Repeat step 2 until $k = 0$. \

  Finally, We have adjusted all the dominoes so that they lie on $H$.
]<proof:proof-1>

