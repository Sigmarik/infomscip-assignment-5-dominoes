#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules
#import "../tiles.typ": *

= Domino Reversal

// Ingredient 4: Show that we can always reverse a domino, making use of the U.

#lemma("Reversal")[
  Let B be a 2-connected, hole-free board of size 2n + 2 for n dominoes where all dominoes lie on a Hamiltonian cycle H (Ingredient 1). Let U be a 2x2 U-configuration in H (Ingredient 2). Assuming all dominoes lie along H we can reverse the orientation of a domino using the U.
]<lem:reversal>
#proof[
  Let the four squares of the U be a, b, c, d, where they exist in that order along H and a and d are the mouth of the U.

By Ingredient 3 we can position the empty squares so that they occupy square a and d of the U, with a single domino occupying b and c.

We label the two halves of the domino A and B. We assume that A occupies b and B occupies c.

#tiles(
      template: (
        "..",
        "..",
      ),
      grid-path(
        (0, 1),
        (1, 1),
      ),
      grid-path(
        stroke: red,
        (1, 1),
      ),
    )

We want to reverse the domino so that B occupies b and A occupies c.

In this situation, we have a 2x2 grid that is made out of 1 domino and two empty squares. By the rules of the game this allows us to use the pivot move (where the domino is pivoted by 90 degrees along one square) and the sideways slide move (where the domino slides to the 2 empty squares).

To reverse the orientation of the domino we perform the following moves:

Step 1.
Pivot around A so that B moves from square c to square a. Now the domino occupies a and b (where A is in b and B is in A) and the two empty squares occupy c and d.

#tiles(
      template: (
        "..",
        "..",
      ),
      grid-path(
        // stroke: luma(150),
        (0, 1),
        (0, 0),
      ),
      grid-path(
        stroke: red,
        (0, 0),
      ),
    )

Step 2.
Do a sideways slide so that the domino now occupies c and d (where A occupies c and B occupies d) and the two empty squares occupy a and b.

#tiles(
      template: (
        "..",
        "..",
      ),
      grid-path(
        // stroke: luma(150),
        (1, 1),
        (1, 0),
      ),
      grid-path(
        stroke: red,
        (1, 0),
      ),
    )

Step 3.

Pivot around A so that B moves from square d to square b. Now the domino occupies b and c again (where A occupies c and B occupies b) and the 2 empty square occupy a and d.

#tiles(
      template: (
        "..",
        "..",
      ),
      grid-path(
        // stroke: luma(150),
        (1, 1),
        (0, 1),
      ),
      grid-path(
        stroke: red,
        (0, 1),
      ),
    )

After these moves the domino occupies the same two squares it started in while halves A and B have switched their position.
]
