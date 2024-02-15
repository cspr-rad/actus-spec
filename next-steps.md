# Next steps

This repository has been developed in tandem with the Haskell implementation of the specification tester and test harness in order to sanity-check the specification:
https://github.com/cspr-rad/actus-haskell

In order to continue this effort and eventually produce a specification version 2.0:

1. Manually implement parsing/rendering the terms of the minimal annuity example in `spec/test-data/contracts/annuity.json`
   Fill in the TODOs in that file as you go along.
   This should give you an idea of what the codegen you'll write later will have to generate.
1. For the required contract terms of ANN:
    1. Correct the specification
        * Real numbers don't exist
        * Allowed values should be optional. `allowedValues = []` Looks like there aren't any allowed values.
        * Make sure the default value is an allowed value.
        * Make sure the type is one of the types that has been specified.
        * Reconsider whether we want enum values to be described using their acronyms or their identifiers.
    1. Produce examples in `test-data`
    1. Add parsing and rendering tests to the implementation
    1. Implement the contract term parsing and rendering
    1. Add the type to the test harness parsing tests
    1. Add the type to the tester parsing tests
    1. Fix the `"TODO"` in the ANN contract test data now that we know what the data looks like
    1. Add the field to the annuity contract parsing and rendering implementation
1. For the ANN contract
    1. Double-check that the ANN contract test data is valid
    1. Add the type to the test harness parsing tests
    1. Add the type to the tester parsing tests
1. Make a code generator for all the contract terms
    1. Correct the specification of each contract term as before
    1. Also implement in the other language
    1. Double-check that all parsing tests pass
1. Make a code generator for all the contracts
    1. Also implement in the other language
    1. Double-check that all parsing tests pass
1. Specify cashflow computation tests
1. For each contract type, starting with ANN
    1. Specify the cashflow computation for the contract
    1. Produce test data for cashflow computations
    1. Implement the cashflow computations
    1. Add cashflow computations to the test harness
    1. Add cashflow computations to the tester
1. Double-check that all the examples in `test-data` are still valid.
1. Incorporate the most up-to-date version of the dictionary.
