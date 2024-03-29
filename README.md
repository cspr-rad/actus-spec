# ACTUS Specification version 2

This is a second version of the ACTUS specification.
It is intended to be the new "source of truth".
Where previous specifications have been inconsistent and ambiguous, this specification aims to be unambiguous and consistent.

## Status of this document

The purpose of this document in its current form is to show what a new version of a specification could look like and how it could be constructed.
It is not sound, complete, or authoritative.

If this new way of specifying is adopted, this specification will be completed, corrected, and updated before becoming authoritative.


## Consistency

Consistency across multiple media can only be constructed or enforced.

As such we make the parts of the spec that can be machine-readible available in `.json` files.
We construct the specification (pdf) to be consistent with that data by generating the parts of the specification that represent the same information.


## Writing

### Dependencies

#### With Nix

1. Install [Nix](https://nixos.org/download)

That's it, Nix handles the rest.

#### Without Nix

1. Install [Typst](https://github.com/typst/typst#installation)
1. Ignore the mentions of `direnv` and `feedback` below.


### Feedback loop

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
