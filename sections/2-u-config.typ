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

#definition("U-Configuration")[
  $t_1, t_2 in B$ form a _U-configuration_ on a hamiltonian cycle $H: {1, 2, ..., n} -> B$ if
  - $t_1$ and $t_2$ are $H$-adjacent and
  - $sigma_H (t_1) = sigma_H (t_2)$.
]<def:u-configuration>

#definition("Delta function")[
  Let $p: {1, 2, ..., n} -> ZZ^2$.
  The _delta function_ $delta_p: ZZ -> ZZ^2$ is defined as
  $delta_p (i) = p^+(i + 1) - p^+(i)$.
]

#corollary[
  If $p: {1, 2, ..., n} -> ZZ^2$ is a path then
  $delta_H [{1, 2, ..., n}] subset {(0, -1), (0, 1), (1, 0), (-1, 0)}$.
]

#corollary[
  $forall k, l in ZZ, k < l space sum_(i=k}^l delta_p (i) = p(l + 1) - p(k)$.
]<cor:delta-integral>

#definition[
  Hamiltonian cycle $H$ is _trivial_ when $|H| = 2$.
]

#statement[
  For any non-trivial hamiltonian cycle $H$\
  $exists i in {3, ..., n}$ such that $(H_i)_0 != (H_1)_0$ and $(H_i)_1 != (H_1)_1$.
]<stmt:diagonal-tile>
#proof[
  Assume the opposite and, without loss of generality, that $(H_2)_0 != (H_1)_0$ and $(H_2)_1 = (H_1)_1$.
  Then $im(delta_H) subset {(-1, 0), (1, 0)}$. Since $sum_(i=1)^n delta_H (i)_0 = 0$, $im(delta_H) = {(-1, 0), (1, 0)}$.
  But then $exists k, l in {1, 2, ..., n}, |k - l| = 1$ such that $delta_H (k) != delta_H (l)$.
  But then $sum_(i=k)^l delta_H (i)_0 = 0$, which according to @cor:delta-integral implies $H(k) = H(l)$, which is a contradiction.
]

#statement[
  Let $H$ be a non-trivial hamiltonian cycle.
  Then $delta_H [{1, 2, ..., n}] = {(0, -1), (0, 1), (1, 0), (-1, 0)}$.
]<stmt:delta-image>
#proof[
  Since @cor:delta-integral is true, $sum_(i=1)^n delta_H (i) = H^+(n + 1) - H^+(1) = H(1) - H(1) = 0$.
  Then $sum_(i=1)^n delta_H (i)_0 = 0$ and $sum_(i=1)^n delta_H (i)_1 = 0$.
  According to @stmt:diagonal-tile, $exists k in {3, ..., n}$ such that $(H_k)_0 != (H_1)_0$ and $(H_k)_1 != (H_1)_1$.
  Then $sum_(i=1)^(k-1) delta_H (i)_0 = 0$ and $sum_(i=1)^(k-1) delta_H (i)_1 = 0$, meaning that
  $exists a in {1, 2, ..., k - 1}, b in {k, k + 1, ..., n}$ such that $delta_H (a) != delta_H (b)$ yet $delta_H (a)_0 = delta_H (b)_0$
  and also
  $exists a in {1, 2, ..., k - 1}, b in {k, k + 1, ..., n}$ such that $delta_H (a) != delta_H (b)$ yet $delta_H (a)_1 = delta_H (b)_1$.
  The latter two statements imply that $im(delta_H) = {(0, -1), (0, 1), (1, 0), (-1, 0)}$.
]

#definition("Turn Sign")[
  Let $p: {1, 2, ..., n} -> ZZ^2$ be a path and $t in B$. Let $i := H^(-1)(t)$.
  Then $sigma_H (t) = delta_H (i) times delta_H (i - 1)$ is the _turn sign_ of $t$ on $H$.
]

#statement[
  Let $H$ be a non-trivial hamiltonian cycle.
  Then $exists i, j in {1, 2, ..., n}, i < j$ such that
  $sigma_H (H(i)) = sigma_H (H(j))$ and
  $forall k in NN, i < k < j space sigma_H (H(k)) = 0$.

  In that case, ${i, j}$ is a _same-turn pair_ and $j - i$ is its _width_.
]<stmt:same-turn-pair>
#proof[
  According to @stmt:delta-image, $im(delta_H) = {(0, -1), (0, 1), (1, 0), (-1, 0)}$.
  Then $exists k, l in {1, 2, ..., n}, k < l$ such that $delta_H (k) != delta_H (l)$ and
  $forall i in {k + 1, ..., l - 1} space delta_H (i) != delta_H (k) and delta_H (i) != delta_H (l)$.
  Then $sigma_H (H(k)) = sigma_H (H(l))$ and $forall i in {k + 1, ..., l - 1} space sigma_H (H(i)) = 0$.
]

#lemma("U-Configuration")[
  Let $B$ be a board without holes. Let $H$ be a hamiltonian path on $B$.
  Then there exists a U-configuration on $H$.
]<lem:u-configuration-old>
#proof[
  Let $P subset {1, 2, ..., n}^2$ be the set of all same-turn pairs on $H$.
  Since $P$ is finite and, according to @stmt:same-turn-pair, non-empty, let $(i, j) in P$ be a same-turn pair of minimum width $w$.
  
  Then $H^+(i - 1)$ and $H^+(j + 1)$ are either on the same row or on the same column.
  Without the loss of generality lets assume that
]

#definition("Edge")[
  ${a, b}$ where $a, b in ZZ^2$ is an _edge_ when $a$ and $b$ are adjacent.
]

#definition[
  Edges $e_1$ and $e_2$ are _adjacent_ if $|e^1 inter e_2| = 1$ and $e_1 union e_2$ is not contained within one row or one column.
]

#definition("Vertex")[
  $v = {a, b, c, d} subset ZZ^2$ is a _vertex_ when $forall x, y, z, w in v$ such that ${x, y}$ and ${z, w}$ are edges
  ${x, y}$ and ${z, w}$ are adjacent.
]

#definition[
  Vertices $v_1$ and $v_2$ are _adjacent_ through an edge $e$ if $v_1 inter v_2 = e$.
]

#definition("Vertex graph")[
  _Vertex graph_ of a set of edges $E$ is a graph $G = (V, E)$ where $V$ is the set of all vertices which are adjacent to any other vertex in $Rho(ZZ^2)$ through an edge in $E$.
]

#definition("Outer boundary")[
  _Outer boundary_ of a board $B$ is the set of all edges $e in Rho(ZZ^2)$ such that $|e inter B| = 1$.g
]

#definition[
  $T_p = {t in Rho(ZZ^2): t #[is an edge and] forall a, b in t space a, b #[are not $p$-adjacent]}$ is a _template_ of path $p$.
]

#statement[
  Let $H$ be a hamiltonian path on a hole-free board $B$ and let $T_H$ be a template of $H$.
  Then the only loop that can be formed in the vertex graph of $T_H$ is the vertex graph of the outer boundary of $B$.
]<stmt:outer-boundary-loop>
#proof[
  Assume the opposite that there exists a loop of edges in $T_H$ that is not part of the outer boundary of $B$.
  Then $exists t_1, t_2 in B$ such that $t_1$ is inside the loop and $t_2$ is outside the loop.
  But since $H$ goes through all tiles by definition, there exists a path from $t_1$ to $t_2$ on $H$ that, by definition, does not intersect any edge of $T_H$.
  Therefore $H$ must intersect the loop, which is a contradiction.
]

#statement[
  Let $B$ be a non-trivial board without holes and with a hamiltonian path $H$.
  Then $exists #[vertex] v subset B$.
]<stmt:contained-vertex>
#proof[
  Let $G$ be the graph formed by tiles of $B$ and their adjacency.
  Assuming the opposite, the graph does not contain a loop of size $4$ because that would create an internal vertex proving the contrary.
  $G$ also cannot have a loop of size less than $4$ by its definition of being an adjacency graph on a square grid.
  
  $G$ cannot be a tree because $H$ is a hamiltonian path and therefore $G$ must contain a loop.
  
  Therefore every loop in $G$ must be of size greater than $4$.
  Let $L$ be a loop of minimal size in $G$.

  If $L$ does not have internal tiles, then 
]

#lemma("U-Configuration")[
  Let $B$ be a non-trivial board without holes. Let $H$ be a hamiltonian path on $B$.
  Then there exists a U-configuration on $H$.
]<lem:u-configuration>
#proof[
  According to @stmt:contained-vertex, $exists v subset B$ such that $v$ is a vertex.
  $v$ is not part of the outer boundary edge graph of $B$ by definition.

  Let $T_H$ be a template of $H$.
  By @stmt:outer-boundary-loop, the only loop that can be formed in the vertex graph of $T_H$ is the outer boundary of $B$.
  Then if $v$ is not part of the vertex graph of $T_H$, two of the tiles of $v$ for a U-configuration on $H$.
  Otherwise let $v$ be a leaf of the vertex graph of $T_H$.
  Then two of the tiles of $v$ also form U-configuration on $H$.
]
