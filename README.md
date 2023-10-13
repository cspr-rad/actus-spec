# ACTUS Specification version 2

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
