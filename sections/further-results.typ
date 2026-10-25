#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules

= Further Results

// Further results: Show that there exists a board that is 2-connected and admits a Hamiltonian
// cycle, but which does not allow arbitrary reconfigurations. Of course this board must have a hole,
// otherwise our theorem states that reconfigurations are always possible.
// Also show that there exists a 2-connected hole-free board with an even number of squares that
// does not admit a Hamiltonian cycle and does not allow arbitrary reconfiguration.
// These two examples show that the two conditions (1) hole-free, and (2) has a Hamiltonian
// cycle, are conditions we cannot simply leave out. But they are not necessary conditions either:
// there exists a 2-connected hole-free board that allows any reconfiguration but does not have a
// Hamiltonian cycle. (The smallest example I can find has 20 grid cells.)
