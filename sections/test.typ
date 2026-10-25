#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#show: thm-rules

= Lorem ipsum

Here is a whole lot of placeholder text:

#lorem(100)

There is also a lobster shown in @fig:lobster.

#figure(
  caption: "A lobster.",
)[
  #image("../assets/lobster.png")
]<fig:lobster>


#theorem[
  A lobster is a crustacean.
] <th:lobster>

#proof()[
  Isn't it obvious?
]
