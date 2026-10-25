#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules

#let dom(body) = [dom(#body)]

#let statement(name: none, body) = thm(supplement: "Statement", name: name, body)

= Problem Statement

// We are interested in boards based on the square grid, composed of a set of squares joined together
// at their edges to form a board. We consider boards with an even number of squares, and dominoes
// that fill the board except for two squares, which are empty. So if we have n dominoes, we have
// 2n + 2 squares. A domino may have one or two colors, that is, the halves may have different colors.
// This makes the orientation of a domino important. We consider boards that are 2-connected and
// have no holes. A board is 2-connected if and only if for any two squares on the board, there are
// two sequences of squares (paths in the dual graph) that do not use the same squares, except for
// the end squares. A path can have length zero if the two squares we examine are adjacent. Then
// there needs to be another path.
// The moves we allow are the straight slide (in the direction of the domino), and the 90 degree
// turn (where the empty grid cell is filled by the adjacent part of the domino, and the other part of
// the domino takes over the position of the part that is moving to the empty grid cell). In certain
// special situations, other moves can be made, in particular, when a domino and has two adjacent
// empty squares that together form a 2 × 2 subgrid. Then a sideways slide can be made, and also a
// pivot. A pivot is a 90 degree turn when one domino half is stationary. A pivot is not possible if
// there is only one empty cell in the neighborhood.
// We choose the setting with two empty squares, because we already know that boards with an
// odd number of squares and only one empty square, never allow arbitrary reconfigurations. This
// is true even for rectangular boards like the 3 × 3 board with four dominoes.
// We will examine the relationship between admitting a Hamiltonian cycle and always being able
// to reconfigure for such boards. In particular, we will show that if a board (by default 2-connected
// and hole-free) admits a Hamiltonian cycle, then reconfiguration is always possible. This requires
// a proof, and proofs have “ingredients”. Each ingredient can be stated as a lemma and must
// be validated with a proof. Some ingredients are simple and a very short proof suffices. Other
// ingredients are harder and the proof may be longer.

#definition("Adjacency")[
  Let $x, y in ZZ^2$. $x$ and $y$ are _adjacent_ if and only if $x - y in {(0, 1), (1, 0), (0, -1), (-1, 0)}$.
]<def:adjacent>

#definition("Path")[
  A sequence $p:{1, 2, ..., n} -> ZZ^2$ is a _path_ when for all $i, j in \{1, ..., n\}$, $p_i = p_j <=> i=j$ and $i + 1 = j =>$ $p_i$ and $p_j$ are adjacent.
]<def:path>

#definition("Connectivity")[
  $B subset ZZ^2$ is _connected_ if and only if for all $x, y in B$, there exists a path $p$ such that $p_1 = x$, $p_n = y$,
  and for all $i in \{1, ..., n\}$, $p_i in B$.
]<def:connected>

#definition("Board")[
  $B subset ZZ^2$ is a _board_ if it is a finite and connected.
]<def:board>

#definition("Tile")[
  $t in ZZ^2$ is a _tile_ of board $B$ if $t in B$.
]<def:tile>

#definition("Domino")[
  Let $B$ be a board and $E$ be an arbitrary set. $d subset P(B times E)$, is a _domino_ when
  - $forall x, y in d$ $x_1$ and $y_1$ are adjacent,
  - $exists x, y in d x eq.not y$,
  - $forall x, y in d$ $x_2 = y_2$.

  $Gamma_(B, E) subset B^2 times E^2$ is the set of all dominoes on board $B$ with coloration $E$.
]<def:domino>

#definition("Orientation")[
  $delta: Gamma_(B, E) -> {0, 1}$, $delta(d) = max im(d) - min im(d)$ is the _orientation_ of a domino.
  A domino $d$ is _horizontal_ if $delta(d) = 0$ and _vertical_ if $delta(d) = 1$.
]<def:orientation>

#definition("Configuration")[
  $C subset Gamma_(B, E)$ is a _configuration_ of a board $B$ with coloration $E$ when
  $forall d_1, d_2 in C dom(d_1) inter dom(d_2) eq.not emptyset => d_1 = d_2$.

  $Theta_(B, E)$ is the set of all configurations of a board $B$ with coloration $E$.
]<def:configuration>

// TODO: Remove if unused. This statement is true, but we may not need it for the proof.
#statement[
  $forall C in Theta_(B, E)$ $C$ is finite, and if $E$ is finite, then $Theta_(B, E)$ is finite.
]
#proof[
  Let $f subset B times C$ where $(t, d) in f <=> t in dom(d)}$.
  Then $f$ is partially defined functional relation because
  $(t, d_1), (t, d_2) in f => dom(d_1) inter dom(d_2) eq.not emptyset => d_1 = d_2$.
  Because of this $f[B]$ is finite as it is an image of a finite set in a partially defined functional relation.\
  $forall d in C space dom(d) subset B and dom(d) eq.not emptyset$, therefore $exists t in dom(d) subset B: f(t) = d$ and $f[B] = C$.

  $Q := Theta_(B, {emptyset})$ is finite because $Q lt.tilde B^2$, which is finite.
  $Theta_(B, E) lt.tilde Q times B times E$, but because $Q$, $B$ and $E$ are finite, $Theta_(B, E)$ is also finite.
]<stmt:finite-configurations>

#definition("Move")[
  $C' in Theta_(B, E)$ is a _move_ of $C in Theta_(B, E)$ if $exists d in C exists d' in C'$ such that $C without d = C' without d'$ and either
  - $exists ! p in d inter d'$ and $delta(d) eq.not delta(d')$, or
  - $delta(d) = delta(d')$, $exists !p in dom(d) inter dom(d')$ and $d[dom(d) without {p}] = {d'(p)} and d'[dom(d') without {p}] = {d(p)}$.
]<def:move>

#corollary()[
  If $C' in Theta_(B, E)$ is a move of $C in Theta_(B, E)$, then $C$ is a move of $C'$.
]<stmt:move-symmetry>

#definition[
  Configuration $C' in Theta_(B, E)$ is _reachable_ from configuration $C in Theta_(B, E)$ if exists a sequence of configurations $C_1, C_2, ..., C_n$ such that $C_1 = C$, $C_n = C'$
  and $forall i, j in {1 ... n} space j = i + 1 => C_i #[is a move of] C_j$.
]

#corollary()[
  Reachability is an equivalence relation on $Theta_(B, E)$.
]<stmt:reachability-equivalence>

#definition("Reshuffle")[
  Two configurations $C, C' in Theta_(B, E)$ are _reshuffles_ of each other if and only if
  $exists #[injective] f: Gamma_(B, E) -> Gamma_(B, E)$ such that $f[C] = {C'}$ and
  $forall d in Gamma_(B, E)$ $im(f(d)) = im(d)$.
]
