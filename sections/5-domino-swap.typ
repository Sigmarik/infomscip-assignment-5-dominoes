#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules
#import "../tiles.typ": *

= Domino Swap

// Ingredient 5: Show that if we consider six squares of the cycle, namely the four U-squares, and
// the two before and the two after, and these contain two dominoes and two empty squares,
// we can always swap the order of the two dominoes in the cycle.

#lemma("Swap")[
  Let B be a 2-connected, hole-free board of size 2n + 2 for n dominoes admitting a Hamiltonian cycle H (Ingredient 1). Let U be a 2x2 U-configuration in H (Ingredient 2). If the six squares consisting of the U-squares, one before the U and and one after the U (along H) contain two dominoes and two empty squares we can swap the order of the two dominoes along H.
]<lem:swap>
#proof[
  Let the four squares of the U be a, b, c, d, where they exist in that order along H and a and d are the mouth of the U. Let e be the square that connects to a and f be the square that connects to d.

By repeating Ingredient 3 we can position the empty squares so that they occupy any 2 adjacent squares of the U, in this case we let them occupy b and c. This automatically means that there are two dominoes in the U which occupy the following pairs of squares: A = (e, a) and B = (d, f). This is the only pair possible as the dominoes all exist on H due to Ingredient 1.
#tiles(
      template: (
        "..",
        "..",
        "..",
      ),
      grid-path(
        stroke: blue,
        (0, 0),
        (0, 1),
      ),
      grid-path(
        stroke: red,
        (1, 0),
        (1, 1),
      ),
    )

We do not consider orientation of each domino when performing the swap, only the position of the two dominoes in H have to be swapped.

Now the following moves can be performed to inverse their position in H:

Step 1: Move A with a straight slide so that it occupies (a, b). We now have the following state: A = (a, b), B = (d, f), Empty squares = (e, c).

#tiles(
      template: (
        "..",
        "..",
        "..",
      ),
      grid-path(
        stroke: blue,
        (0, 1),
        (0, 2),
      ),
      grid-path(
        stroke: red,
        (1, 0),
        (1, 1),
      ),
    )

Step 2: Move A with a 90 degree turn so that it occupies (b, c). We now have the following state: A = (b, c), B = (d, f), Empty squares = (e, a).

#tiles(
      template: (
        "..",
        "..",
        "..",
      ),
      grid-path(
        stroke: blue,
        (1, 2),
        (0, 2),
      ),
      grid-path(
        stroke: red,
        (1, 0),
        (1, 1),
      ),
    )

Step 3: Domino B now exists in a 2x2 square with the two empty squares, which makes a sideway slide towards (e, a) legal. We now have the following state: A = (b, c), B = (e, a), Empty squares = (d, f).

#tiles(
      template: (
        "..",
        "..",
        "..",
      ),
      grid-path(
        stroke: blue,
        (1, 2),
        (0, 2),
      ),
      grid-path(
        stroke: red,
        (0, 0),
        (0, 1),
      ),
    )

Step 4: Move A with a 90 degree turn so that it occupies (c, d). We now have the following state: A = (c, d), B = (e, a), Empty squares = (b, f).

#tiles(
      template: (
        "..",
        "..",
        "..",
      ),
      grid-path(
        stroke: blue,
        (1, 1),
        (1, 2),
      ),
      grid-path(
        stroke: red,
        (0, 0),
        (0, 1),
      ),
    )

Step 5: Move A with a straight slide so that it occupies (d, f). We now have the following state: A = (d, f), B = (e, a), Empty squares (b, c).

#tiles(
      template: (
        "..",
        "..",
        "..",
      ),
      grid-path(
        stroke: blue,
        (1, 0),
        (1, 1),
      ),
      grid-path(
        stroke: red,
        (0, 0),
        (0, 1),
      ),
    )

After performing these steps we have swapped the two dominoes along H.
]
