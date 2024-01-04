#import "@preview/polylux:0.3.1": *
#import "@preview/diagraph:0.2.0": *


#import themes.clean: *

#set text(font: "Inria Sans")

#show: clean-theme.with(
  color: none,
)


#enable-handout-mode(true)

#title-slide(
  title: "ACTUS Specification 2.0"
  , authors: [Tom Sydney Kerckhove]
  , date: "2024-01-17"
)

#slide[
  #align(center, [
    Why am I talking about this?
  ])
]

#slide[
  = Current situation
  #figure[
    #set text(size: 11pt)
    #render(read("current.dot"))
  ]
]

#slide[
  = Our proposals

  1. Have a single-source of truth
  2. Fix important issues in the specification
  3. Maintain machine-readible tests
  4. Make the specification with typst
  5. Get rid of the excel entirely
]

#slide[
  = Single source of truth
  #figure[
    #set text(size: 11pt)
    #render(read("source-of-truth.dot"))
  ]
]

#slide[
  = Fix important issues in the spec

  - Specify exactly which types are expected to be used:
    - Real numbers don't exist.
    - Time is complicated.
    - Money *must not* be represented with floating-point numbers.
  - Fix missing or inconsistent parts of the dictionary
]

#slide[
  = Specify machine-readable tests
  #render(read("tests.dot"))
]

#slide[
  = Make the specification with typ
                     
  - Free & Open-source                       
  - Modern alternative to LaTeX              
  - Fast incremental compilation           
  - Excellent error messages  

  #align(center, link("https://typst.app/"))
]

#slide[
  = Get rid of the Excel sheet

  Alternatively: generate the sheet from the specification
]

#slide[
  = Proposed situation
  #figure[
    #set text(size: 11pt)
    #render(read("proposal.dot"))
  ]
]

#slide[
  = References

  #set text(size: 16pt)
  - https://github.com/cspr-rad/actus-spec

  - https://cs-syd.eu/posts/2022-08-22-how-to-deal-with-money-in-software
]
