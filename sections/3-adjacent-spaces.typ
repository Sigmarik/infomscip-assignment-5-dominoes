#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules

= Adjacent Spaces

// Ingredient 3: Show that we can always get the two empty spaces adjacent in the U (considering
// Ingredient 4, where in the U do you want them?).

#lemma("Adjacent Spaces")[
  Let B be a 2-connected, hole-free board of size 2n + 2 for n dominoes where all dominoes lie on a Hamiltonian cycle H (Ingredient 1). Let U be a 2x2 U-configuration in H (Ingredient 2). Assuming all dominoes lie along H we can move the two empty squares so that they lie adjacent in the U and exist on the endpoints of the U.
]<lem:adjacent-spaces>
#proof[
  Let the four squares of the U be a, b, c, d, where they exist in that order along H and a and d are the mouth of the U. We want the empty squares at a and d.

Step 1.
All dominoes lie along H as per ingredient 1, so each domino occupies two consecutive squares of said cycle.

We call the two empty squares $E_1$ and $E_2$. Between said empty squares an even number of occupied squares must exist on the cycle, since they are covered by dominoes.

Step 2.
Suppose there are k dominoes between $E_1$ and $E_2$ and we want to move $E_1$ so that it touches $E_2$. We can move the domino closet to $E_1$ so that it fills $E_1$ and creates a new empty square two positions further along the cycle towards $E_2$.

Repeating this operation k times moves $E_1$ so that it touches $E_2$.

Step 3.
Now we have $E_1$ and $E_2$ so that they occupy consecutive positions $P_i$ and $P_(i+1)$ on H. All remaining squares along H are occupied by dominoes. Now we show that we can move the empty squares one position at a time along H.

First, move the domino that occupies $P_(i-1)$ and $P_(i-2)$ so that it occupies $P_i$. This creates a new empty square on $P_(i-2)$. Now repeat this operation backwards along the cycle so it occupies the newly created empty square. Eventually the domino that occupies $P_(i+2)$ and $P_(i+3)$ is moved so that the two empty squares occupy $P_(i+1)$ and $P_(i+2)$.

Since the entire operation can be repeated we can move the two empty squares to any pair of squares on H.

Step 4.
We want the two empty squares in the U, defined as squares a, b, c, d, along H. By repeating step 3 we can move the two empty squares to be on square a and b. If square a and b are empty there must be a domino that occupies both c and d on its own.
We now have two empty squares that lie adjacent to the U. Now we show that we can move them to occupy a, d, while still being adjacent to each other.

We can now move this domino in the following way along the cycle;

(c,d) → (b,c).

This move is valid as b, c, d, form a right angle and b is empty.

This results in d becoming empty and b becoming occupied while a remains empty.

Now we have a, b, c, d, where a and d are empty and b, c are occupied by one domino. Due to the U being a 2x2 square the squares are still adjacent to each other after moving to a, d.
]
