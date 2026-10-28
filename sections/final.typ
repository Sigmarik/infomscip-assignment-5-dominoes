#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules

= Transformability of Layouts

// Final step: Show that these ingredients, used in the right way (the “recipe”), together form a
// proof that any two configurations of dominoes on the board can be transformed into each other.

#theorem[
  Let B be a 2-connected, hole-free board of size 2n + 2 for n dominoes admitting a Hamiltonian cycle H.  Any two valid configurations of n dominoes can be transformed into each other using permitted moves.
]<thm:transformability>
#proof[
  Let $B_1$ and $B_2$ be two arbitrary valid configurations of n dominoes.

Ingredient 2 shows that H must contain a U-configuration somewhere on a board that admits a Hamiltonian cycle.

By Ingredient 1 all dominoes can be moved on cycle H using only valid moves.

By ingredient 3 we can position the empty squares so that we can use the U-configuration for future steps.

Once all the dominoes lie together on H by Ingredient 1 we can move the empty squares to any position wanted by ingredient 3. This allows us to to position both the empty squares and specific dominoes to the U-configuration.

Now that we can bring specific dominoes and the empty squares to the U-configuration, we can perform the following actions:

By ingredient 4, we can reverse any individual domino using the U-configuration. This way we can get any desired orientation of any domino.

By ingredient 5, we can swap any consecutive dominoes using the U-configuration along H. Since we can get any order of dominoes by performing a sequence of swaps, we can obtain any desired order of dominoes along H.

By performing these actions we can transform any configuration into a fixed configuration C, in which all dominoes and empty squares have fixed locations and orientations.

Since we can transform any configuration into C, we can transform both $B_1$ and $B_2$ into C as such: 
$B_1 → C$
$B_2 → C$

As all actions to transform a board to C are valid and reversible we can also reverse the second transformation and obtain the following sequence:

$B_1 → C → B_2$

Which shows that any two 2-connected, hole-free board of size 2n + 2 for n dominoes admitting a Hamiltonian cycle H can be transformed into each other.
]
