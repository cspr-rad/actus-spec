# ACTUS Specification version 2

This is a second version of the ACTUS specification.
It is intended to be the new "source of truth".
Where previous specifications have been inconsistent and ambiguous, this specification aims to be unambiguous and consistent.


## Consistency

Consistency across multiple media can only be constructed or enforced.

As such we make the parts of the spec that can be machine-readible available in `.json` files.
We construct the specification (pdf) to be consistent with that data by generating the parts of the specification that represent the same information.


## Writing

1. Enter the dev shell

   With `direnv`:

   ```
   direnv allow
   ```

   Without `direnv`:

   ```
   Nix develop
   ```

2. Start the feedback loop:

   Pure `typst` (faster):

   ```
   typst watch spec/main.typ
   open spec/main.pdf
   ```

   With `feedback`:

   ```
   feedback build
   ```
