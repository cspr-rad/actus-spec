#set document(title: "ACTUS Specification version 2")
#set heading(numbering: "1.1.")

// Helper functions for writing
#let todo(str) = box({
  text("TODO: ", blue)
  text(str)
})
#let citation_needed = todo("[CITATION NEEDED]")
#let dict_todo(str) = box({
  text("TODO [PROBLEM IN DICTIONARY]: ", red)
  text(str)
})

// Data import
#let dictionary = json("dictionary.json")

// TODO
// Maybe we find a way to do these declarations for each event
// automatically? Perhaps we could just be required to write
// event("monitoring") instead of #AD

#let terms = dictionary.at("terms")

#let make_term_label(identifier) = {
  let term = terms.at(identifier)
  link(
    label("term_" + term.identifier),
    [ #raw(term.acronym) (#text(term.name)) ],
  )
}

#let IPAC = make_term_label("accruedInterest")
#let AMD = make_term_label("amortizationDate")
#let ARIPANXi = make_term_label("arrayCycleAnchorDateOfInterestPayment")
#let ARPRANXj = make_term_label("arrayCycleAnchorDateOfPrincipalRedemption")
#let ARRRANX = make_term_label("arrayCycleAnchorDateOfRateReset")
#let ARIPCLi = make_term_label("arrayCycleOfInterestPayment")
#let ARPRCLj = make_term_label("arrayCycleOfPrincipalRedemption")
#let ARRRCL = make_term_label("arrayCycleOfRateReset")
#let ARFIXVAR = make_term_label("arrayFixedVariable")
#let ARINCDEC = make_term_label("arrayIncreaseDecrease")
#let ARPRNXTj = make_term_label("arrayNextPrincipalRedemptionPayment")
#let ARRATE = make_term_label("arrayRate")
#let BDC = make_term_label("businessDayConvention")
#let CLDR = make_term_label("calendar")
#let IPCED = make_term_label("capitalizationEndDate")
#let MRCLH = make_term_label("clearingHouse")
#let CDD = make_term_label("contractDealDate")
#let CID = make_term_label("contractID")
#let PRF = make_term_label("contractPerformance")
#let CNTRL = make_term_label("contractRole")
#let CTS = make_term_label("contractStructure")
#let CT = make_term_label("contractType")
#let CPID = make_term_label("counterpartyID")
#let CECV = make_term_label("coverageOfCreditEnhancement")
#let CRID = make_term_label("creatorID")
#let CETC = make_term_label("creditEventTypeCovered")
#let CLA = make_term_label("creditLineAmount")
#let CUR = make_term_label("currency")
#let CUR2 = make_term_label("currency2")
#let DVANX = make_term_label("cycleAnchorDateOfDividend")
#let FEANX = make_term_label("cycleAnchorDateOfFee")
#let IPCBANX = make_term_label("cycleAnchorDateOfInterestCalculationBase")
#let IPANX = make_term_label("cycleAnchorDateOfInterestPayment")
#let MRANX = make_term_label("cycleAnchorDateOfMargining")
#let OPANX = make_term_label("cycleAnchorDateOfOptionality")
#let PRANX = make_term_label("cycleAnchorDateOfPrincipalRedemption")
#let RRANX = make_term_label("cycleAnchorDateOfRateReset")
#let SCANX = make_term_label("cycleAnchorDateOfScalingIndex")
#let DVCL = make_term_label("cycleOfDividend")
#let FECL = make_term_label("cycleOfFee")
#let IPCBCL = make_term_label("cycleOfInterestCalculationBase")
#let IPCL = make_term_label("cycleOfInterestPayment")
#let MRCL = make_term_label("cycleOfMargining")
#let OPCL = make_term_label("cycleOfOptionality")
#let PRCL = make_term_label("cycleOfPrincipalRedemption")
#let RRCL = make_term_label("cycleOfRateReset")
#let SCCL = make_term_label("cycleOfScalingIndex")
#let IPPNT = make_term_label("cyclePointOfInterestPayment")
#let RRPNT = make_term_label("cyclePointOfRateReset")
#let IPDC = make_term_label("dayCountConvention")
#let DQP = make_term_label("delinquencyPeriod")
#let DQR = make_term_label("delinquencyRate")
#let DS = make_term_label("deliverySettlement")
#let EOMC = make_term_label("endOfMonthConvention")
#let DVEX = make_term_label("exDividendDate")
#let XA = make_term_label("exerciseAmount")
#let XD = make_term_label("exerciseDate")
#let FEAC = make_term_label("feeAccrued")
#let FEB = make_term_label("feeBasis")
#let FER = make_term_label("feeRate")
#let RRFIX = make_term_label("fixingPeriod")
#let PFUT = make_term_label("futuresPrice")
#let GRP = make_term_label("gracePeriod")
#let CEGE = make_term_label("guaranteedExposure")
#let IED = make_term_label("initialExchangeDate")
#let MRIM = make_term_label("initialMargin")
#let IPCB = make_term_label("interestCalculationBase")
#let IPCBA = make_term_label("interestCalculationBaseAmount")
#let SCIP = make_term_label("interestScalingMultiplier")
#let RRLC = make_term_label("lifeCap")
#let RRLF = make_term_label("lifeFloor")
#let MRMML = make_term_label("maintenanceMarginLowerBound")
#let MRMMU = make_term_label("maintenanceMarginUpperBound")
#let MOC = make_term_label("marketObjectCode")
#let RRMO = make_term_label("marketObjectCodeOfRateReset")
#let SCMO = make_term_label("marketObjectCodeOfScalingIndex")
#let MVO = make_term_label("marketValueObserved")
#let MD = make_term_label("maturityDate")
#let MPFD = make_term_label("maximumPenaltyFreeDisbursement")
#let DVNP = make_term_label("nextDividendPaymentAmount")
#let PRNXT = make_term_label("nextPrincipalRedemptionPayment")
#let RRNXT = make_term_label("nextResetRate")
#let IPNR = make_term_label("nominalInterestRate")
#let IPNR2 = make_term_label("nominalInterestRate2")
#let NPD = make_term_label("nonPerformingDate")
#let NT = make_term_label("notionalPrincipal")
#let NT2 = make_term_label("notionalPrincipal2")
#let SCNT = make_term_label("notionalScalingMultiplier")
#let OPXED = make_term_label("optionExerciseEndDate")
#let OPXT = make_term_label("optionExerciseType")
#let OPS1 = make_term_label("optionStrike1")
#let OPS2 = make_term_label("optionStrike2")
#let OPTP = make_term_label("optionType")
#let PYRT = make_term_label("penaltyRate")
#let PYTP = make_term_label("penaltyType")
#let RRPC = make_term_label("periodCap")
#let RRPF = make_term_label("periodFloor")
#let PDIED = make_term_label("premiumDiscountAtIED")
#let PPEF = make_term_label("prepaymentEffect")
#let PPP = make_term_label("prepaymentPeriod")
#let PPRD = make_term_label("priceAtPurchaseDate")
#let PTD = make_term_label("priceAtTerminationDate")
#let PRD = make_term_label("purchaseDate")
#let QT = make_term_label("quantity")
#let RRMLT = make_term_label("rateMultiplier")
#let RRSP = make_term_label("rateSpread")
#let SCEF = make_term_label("scalingEffect")
#let SCCDD = make_term_label("scalingIndexAtContractDealDate")
#let SEN = make_term_label("seniority")
#let CURS = make_term_label("settlementCurrency")
#let STP = make_term_label("settlementPeriod")
#let SD = make_term_label("statusDate")
#let TD = make_term_label("terminationDate")
#let UT = make_term_label("unit")
#let MRVM = make_term_label("variationMargin")
#let XDN = make_term_label("xDayNotice")

#let eventsList = dictionary.at("event").at("eventType").at("allowedValues")
#let events = (:)
#for e in eventsList {
  events.insert(e.identifier, e)
}

#let make_event_label(identifier) = [
  #let event = events.at(identifier)
  #locate(loc => [
    #let l = label("event_" + event.identifier)
    #let arr = query(l, loc)
    #if (arr.len() > 1) {
      panic(event.identifier)
    }
    #link(l, [ #raw(event.acronym) (#text(event.name)) ])
  ])
]

#let AD = make_event_label("monitoring")
#let IED = make_event_label("initialExchange")
#let FP = make_event_label("feePayment")
#let PR = make_event_label("principalRedemption")
#let PD = make_event_label("principalDrawing")
#let PRF = make_event_label("principalPaymentAmountFixing")
#let PY = make_event_label("penalytPayment")
#let PP = make_event_label("principalPrepayment")
#let IP = make_event_label("interestPayment")
#let IPCI = make_event_label("interestCapitalization")
#let CE = make_event_label("creditEvent")
#let RRF = make_event_label("rateResetFixed")
#let RR = make_event_label("rateResetVariable")
#let DV = make_event_label("dividendPayment")
#let PRD = make_event_label("purchase")
#let MR = make_event_label("marginCall")
#let TD = make_event_label("termination")
#let SC = make_event_label("scalingIndexFixing")
#let IPCB = make_event_label("interestCalculationBaseFixing")
#let MD = make_event_label("maturity")
#let XD = make_event_label("exercise")
#let STD = make_event_label("settlement")

#let state_variables = dictionary.at("states")
#let make_state_variable_label(identifier) = {
  let state_variable = state_variables.at(identifier)
  link(
    label("state_variable_" + state_variable.identifier),
    [ #raw(state_variable.acronym) (#text(state_variable.name)) ],
  )
}

#let Ipac = make_state_variable_label("accruedInterest")
#let Ipac2 = make_state_variable_label("accruedInterest2")
#let Prf = make_state_variable_label("contractPerformance")
#let Xa = make_state_variable_label("exerciseAmount")
#let Xd = make_state_variable_label("exerciseDate")
#let Feac = make_state_variable_label("feeAccrued")
#let Icba = make_state_variable_label("interestCalculationBaseAmount")
#let Scip = make_state_variable_label("interestScalingMultiplier")
#let Md = make_state_variable_label("maturityDate")
#let Prnxt = make_state_variable_label("nextPrincipalRedemptionPayment")
#let Ipnr = make_state_variable_label("nominalInterestRate")
#let Ipnr2 = make_state_variable_label("nominalInterestRate2")
#let Npd = make_state_variable_label("nonPerformingDate")
#let Nt = make_state_variable_label("notionalPrincipal")
#let Nt2 = make_state_variable_label("notionalPrincipal2")
#let Scnt = make_state_variable_label("notionalScalingMultiplier")
#let Sd = make_state_variable_label("statusDate")
#let Td = make_state_variable_label("terminationDate")

#let contracts = dictionary.at("taxonomy")

#let make_contract_label(identifier) = {
  let contract = contracts.at(identifier)
  link(
    label("contract_" + contract.identifier),
    [ #raw(contract.acronym) (#text(contract.name)) ],
  )
}

#let ANN = make_contract_label("annuity")
#let CLM = make_contract_label("callMoney")
#let CAPFL = make_contract_label("capFloor")
#let CSH = make_contract_label("cash")
#let CEC = make_contract_label("collateral")
#let COM = make_contract_label("commodity")
#let BNDCP = make_contract_label("convertibleNote")
#let CDSWP = make_contract_label("creditDefaultSwap")
#let CLNTE = make_contract_label("creditLinkedNote")
#let EXOTi = make_contract_label("eXOTi")
#let ANX = make_contract_label("exoticAnnuity")
#let LAX = make_contract_label("exoticLinearAmortizer")
#let NAX = make_contract_label("exoticNegativeAmortizer")
#let FXOUT = make_contract_label("foreignExchangeOutright")
#let FUTUR = make_contract_label("future")
#let CEG = make_contract_label("guarantee")
#let LAM = make_contract_label("linearAmortizer")
#let MAR = make_contract_label("margining")
#let NAM = make_contract_label("negativeAmortizer")
#let OPTNS = make_contract_label("option")
#let PBN = make_contract_label("perpetualBonds")
#let SWPPV = make_contract_label("plainVanillaSwap")
#let PAM = make_contract_label("principalAtMaturity")
#let REP = make_contract_label("repurchaseAgreement")
#let SCRCR = make_contract_label("securitizationCreditRisk")
#let SCRMR = make_contract_label("securitizationMarketRisk")
#let STK = make_contract_label("stock")
#let SWAPS = make_contract_label("swap")
#let TRSWP = make_contract_label("totalReturnSwap")
#let UMP = make_contract_label("undefinedMaturityProfile")
#let BNDWR = make_contract_label("warrant")

#let applicability_map = dictionary.at("applicability")

// Title page
#page(align(center + horizon, text(30pt, "ACTUS Specification version 2")))
#outline(title: auto, indent: auto)
#pagebreak()

This document represents a revision of the ACTUS specification. It focusses on
consistency, a lack of ambiguity, and helping with practical implementations.

The specification describes multiple contract types. For each contract type, it
first describes the specification, then examples, and finally test cases. These
test cases are machine readible such that each implementation can use them to
test itself. We also describe a test harness that any implementor can use to test
their implementation against arbitrary test cases.

= Prelude

== Note on terminology

#show "must": raw("MUST")
#show "must not": raw("MUST NOT")
#show "should": raw("SHOULD")
#show "should not": raw("SHOULD NOT")
#show "may": raw("MAY")

The key words must, must not, required, shall, shall not, should, should not,
recommended, may, and optional in this document are to be interpreted as
described in #link("https://datatracker.ietf.org/doc/html/rfc2119)")[RFC 2119].

== MIME types

The ACTUS interchange format is suitable as an exchange format between
applications or systems. The format is defined in terms of the MIME content
types as specified in #link("https://datatracker.ietf.org/doc/html/rfc2046")[RFC 2046]:
`application/actus+json` or `application/actus+cbor`.

=== Note on encoding

When using the `application/actus+json` MIME type, the text encoding must be #link("https://datatracker.ietf.org/doc/html/rfc3629")[UTF-8 (see RFC 3629)] as
specified by #link("https://datatracker.ietf.org/doc/html/rfc8259")[RFC 8259].
The `application/actus+cbor` MIME type specifies its own non-textual encoding.

#let examples(filename) = {
  heading("Examples:", level: 3)

  let validfile = "test-data/" + filename + ".json"
  let valid_examples = json(validfile)
  if valid_examples.len() == 0 {
    todo("Come up with valid examples and put them in")
    raw(validfile)
    "."
  } else {
    text("The following values must parse.")
    list(..valid_examples.map(example => {
      text(example.explanation + ":")
      linebreak()
      raw(json.encode(example.value, pretty: true))
    }))
    text("See ")
    raw(validfile)
  }

  linebreak()
  linebreak()

  let invalidfile = "test-data/" + filename + "-invalid.json"
  let invalid_examples = json(invalidfile);
  if invalid_examples.len() == 0 {
    todo("Come up with invalid examples and put them in")
    raw(invalidfile)
    "."
  } else {
    text("The following values must not parse.")
    list(..invalid_examples.map(example => {
      text(example.explanation + ":")
      linebreak()
      raw(json.encode(example.value, pretty: false))
    }))
    text("See ")
    raw(invalidfile)
  }
}

= Data Types

While the original ACTUS specification describes contract schedules using
mathematical notation and, in particular, real numbers, we want to take a more
practical and exact approach. Describing numbers or even amounts of money as
real numbers is not helpful for implementors. Indeed, real numbers cannot be
represented in computers. Even representing fractional numbers has its issues
#citation_needed.

We will therefore specify the exact data types that implementations can use to
adhere to the specification. In particular, this specification aims to describe
exactly how implementations must behave when precision is lost due to the
reality of working in a finite amount of time and space.

== Enum <type_Enum>

When a value is of an enum type, the allowed values are specified.

Unrecognised values must be rejected.

== Integer <type_Integer>

An Integer is an integer number. The integer is represented as a JSON number.
Parsers should reject numbers with a decimal point and must reject numbers with
any digits past the decimal point.

Integers must have no range restriction.

#examples("integer")

== Natural <type_Natural>

A natural is a natural number. It is an integer (see @type_Integer) with the
additional restriction that it must not be negative (but may be zero).

Naturals must not have a range restriction.

#examples("natural")

== Rational <type_Rational>

A rational number is represented as a pair of integers (see @type_Integer).

In JSON they are specified as a list of exactly two elements which are each
Integers (see @type_Integer). The first is the numerator and the second the
denominator. The denominator must not be zero and should not be negative.
Rational numbers should be specified in normalised form.

The integers that make up a rational must not have any range restrictions.

#examples("rational")

== Positive Rational <type_PositiveRational>

A positive rational number is a rational number (see @type_Rational) except
instead of a pair of integers it is a pair of naturals (see @type_Natural).

The naturals that make up a positive rational must not have any range restrictions.

#examples("positive-rational")

== Real <type_Real>

#todo(
  "Real numbers don't exist in computers. We must get rid of this section.",
)

== Day

A day is represented (internally) as an unsigned integral number of days since
1970-01-01.
#todo("Specify the minimum range for a data type that is used.")

A day is specified in the form #raw("YYYY-MM-DD").

#examples("day")

== Second of day <type_SecondOfDay>

A second of day is represented as an unsigned integral number of seconds since the
start of the day. This number must be between $0$ and $86400$ ($24 dot 60 dot 60$).

A second of day is specified in the form #raw("HH:MM:SS").

#examples("second-of-day")

== Local second <type_LocalSecond>

A datetime is a tuple of a day and a second of day.

A second of day is specified in the form #raw("YYYY-MM-DD HH:MM:SS").

#examples("local-second")

== Timezone offset

A timezone offset is represented (internally) as an integral number of minutes
away from GMT. Note that a timezone offset is only valid within a timezone at a
given time.

A timezone offset is specified in the form #raw("[+-]HH:MM").

#examples("time-zone-offset")

== Timezone

A timezone, in theory, is a function from local datetimes without timezone
offset, to timezone offsets.
#todo(
  "Refer to the timezone database to describe how this mapping works in practice",
)

== Timestamp <type_Timestamp>

A timestamp is a local second in the UTC timezone. See @type_LocalSecond
#todo(
  "What does a timestamp mean in the actus spec? which granularity? which Timezone? leap seconds? Are we sure it's not a 'Day' instead?",
)

== Quantisation factor <type_QuantisationFactor>

For each currency, a minimal quantisation must be defined. For example, the
minimal quantisation of USD may be defined as 1 cent.

The quantisation factor is defined as the number of minimal quantisations that
represent one unit of the currency. For example, The quantisation factor of USD
is then 100, because 100 cents equals one USD.

A quantisation factor must be positive integral number but must not have a range
greater than 32 bits ($[0 .. 2^32]$) and must not be zero.

Numbers specified with a decimal point should be rejected.
Non-integers must be rejected.

#examples("quantisation-factor")

== Currency <type_Currency>

A currency must specify its quantisation factor (#raw("factor")).

A currency is identified by its #raw("uid"), which is the key in the map of
currencies in the ACTUS file that it is defined in.
See @type_Currencies.
As such, these unique identifiers must be unique within an ACTUS file.
A currency may also specify a symbol.
If no symbol is defined, the #raw("uid") may be used as the symbol.

This specification does not define how amounts of money are presented to users.
Many different ways of doing so are in use already, so this specification allows
the currency object to contain info about this. In order for that to not break
any other implementation's parsing, unrecognised fields in the currency object
must be ignored.

#examples("currency")

== Currencies <type_Currencies>

A map of currency symbol to currency. See @type_Currency

#examples("currencies")

== Positive amount of money <type_Amount>

Positive amounts of money must be represented (internally) as a positive
integral number of a given minimal quantisations of its currency.
An amount of money must not be represented as a binary floating point number, a
decimal floating point number, or an arbitrary-precision rational number.
For example, one USD can be represented as `100` cents if the quantisation
factor is chosen to be 100.

A positive amount must have a range of at least 64 bits $[0 .. 2^64-1]$ and may
be specified using an unsigned 64-bit integer, e.g. `u64` in Rust or `Word64`
in Haskell.

That means an implementation must be able to roundtrip the json value `18446744073709551615`.

#examples("amount")

== Account of money <type_Account>

An account of money is like an amount of money (see @type_Amount) but without
the restriction that it must be positive.

An account must have a range of at least 65 bits $[-(2^64-1) .. (2^64-1)]$.

That means an implementation must be able to roundtrip the json value `18446744073709551615` and its negation.

#examples("account")

== Amount with currency <type_AccountWithCurrency>

An amount with currency is an amount (#raw("amount")) (see @type_Amount)
specified with a unique identifier of a currency (#raw("currency")) (see
@type_Currency). Any currency refered to in the #raw("currency") field of an
amount with currency must have been defined in the same file.

#examples("amount-with-currency")

== Account with currency <type_AccountWithCurrency>

An account with currency is an account (#raw("account")) (see @type_Account)
specified with a unique identifier of a currency (#raw("currency")) (see
@type_Currency). Any currency refered to in the #raw("currency") field of an
account with currency must have been defined in the same file.

#examples("account-with-currency")

== Contract
=== Contract Terms

A contract term is a value that configures a contract. They are detailed further
in the terms section (see @terms).

=== Contract <type_Contract>

A contract is an object where the keys are the names of terms and the values are
their corresponding values. They are detailed further in the contracts section
(see @contracts).

#todo("Make sure this is a valid contract")
#examples("contract")

=== Contracts <type_Contracts>

Contracts can be put together in a map from contract identifier to contract.
If a contract identifier is specified in the contract as well, then it must match its identifier.

#examples("contracts")

=== Events

An event is an object with the following fields:

#todo("figure out what needs to be in these?")
#examples("event")

=== Schedules

#todo("What are schedules?")

=== State variables

A contract term is a value that configures a contract. They are detailed further
in the state variables section (see @state_variables).

#todo("examples")

== ACTUS file <type_File>

An actus file defines a collection of currencies (#raw("currencies")) (see
@type_Currencies)) and ACTUS contracts (#raw("contracts")) (see @type_Contracts).

#examples("file")

== Tests

An actus test is a combination of an actus file and the expected results.

#todo("examples")
#todo(
  "Define an exact format for the results of computing results of actus contracts",
)

== Specification tester and test harness

This standard specifies the workings of a test harness.
A test harness is and application that exposes the following test harness api to allow an implementation to be tested.
A specification tester is a program that can test an implementation of this standard by interacting with such a test harness.
To allow for maximally interoperable implementations and language agnostic
testing, the test harness communicates over the stdin and stdout streams.

A specification tester may support only some types of tests.
A test harness must be able to handle at least every one of the following tests.

=== Test input

A test is a JSON object with these values:

- The `id` key to identify the test. This string value must be unique in a test harness session.
- The `type` key that describes the type of the test.
- The `arguments` key that configures the test further.
  This key may be omitted if there are no arguments.
- The `value` key that contains the value upon which the test is to be executed.

For every test that it generates, the specification tester must know the expected
  result, but must not make this available in the test.

#examples("general-test")

=== Test result

A test result is a JSON object with these values:

- The `id` key to identify which test the results corresponds to.
- The `result` key with the test-specific result.
  This key may be absent if the test passed.
- An `error` key with an error that the test harness might have run into.
  This key must be absent if the test passed.

The exact shape of the `result` value will depend on which type of test the result belongs to.

#examples("general-test-result")

=== Test session

A specification tester interacts with a test harness by connecting to the standard input and standard output streams of the test harness.
The specification tester sends newline-delimited test input JSON objects to the test harness on stdin.
It expects to read test newline-delimited test output JSON objects from the test harness on stdout.

A test harness may send test results in a different order than the tester sent the corresponding inputs.
(This allows for parallel testing without extra bookkeeping on the test harness' side.)

The result of a test session is either a 0 (success) or nonzero (failure) exit code.
The tester may report additional details on the standard error stream.

A specification tester may fail immediately upon receiving the first incorrect test result but may continue to gather more test failures first as well.
A specification tetser must fail if the implementation failed to produce a result for every test.
This could be because the implementation crashed or because it "forgot" to perform a test.

=== Parsing test

A parsing test aims to test if an implementation can correctly parse (and render), or reject, a given value.
It test uses a `type` argument to describe the type that is to be parsed.
The `value` key describes the JSON value that is to be parsed.

A parsing test expects an object with two keys as a result.

- `parses`: A boolean that describes if the parsed succesfully. `false` if the value was rejected.
- `rendered`: The rendered version of the value that the implementation parsed.
  This key must be absent if parsing failed, so that the tester can distinguish between a parse failure and succesfully parsing `null`.
- `error`: A parse error. This key must be absent if parsing succeeded.

#examples("parsing-test")

#examples("parsing-test-result")

= Shared functions

== Annuity Amount Function

$ A(s,T,n,a,r) = (n + a) frac(product_(i = 1)^(m - 1) (1 + r Y (t_i, t_(i+1))), 1 + sum_(i = 1)^(m - 1) product_(j = i)^(m - 1) (1 + r Y (t_j, t_(j+1)))) $

= Terms <terms>

#for term in terms.values() [
  === #text(term.name) (#raw(term.acronym))
  #label("term_" + term.identifier)

  Group: #text(term.group)

  #if (term.default != "") [
    Default value:
    #if (term.type == "Enum") {
      let default_value = term.allowedValues.find(allowed_value => allowed_value.identifier == term.default)
      if default_value == none {
        dict_todo(
          "Default value not found in allowed values (needs to be an acronym): " + term.default,
        )
      } else {
        link(
          label("term_" + term.identifier + "_allowed_value_" + term.default),
          raw(default_value.acronym),
        )
      }
    } else {
      raw(term.default)
    }
  ]

  #text(
    term.at("description", default: dict_todo("No description for this term")),
  )

  #todo(
    "Link to types so that we're sure that every type is specified. In order to do so we will have to be able to strip [] for the link",
  )
  Type: #text(term.type)
  #if (term.type == "Real") [
    #todo(
      "Real numbers don't exist in computers. We need to change this type. Most likely to an amount of money.",
    )
  ]
  #if (term.type == "Enum") [
    with allowed values:
    #for allowed_value in term.allowedValues [
      - #raw(allowed_value.acronym) (#text(allowed_value.name)) #label(
          "term_" + term.identifier + "_allowed_value_" + allowed_value.identifier,
        )

        #text(allowed_value.description)

    ]
  ]

  // TODO make examples for all terms
  #if (term.identifier == "contractID") [
    #examples("terms/" + term.identifier)
  ]
]

= Events

#for event in events.values() [
  === #text(event.name) (#raw(event.acronym))
  #label("event_" + event.identifier)

  Sequence: #text(event.sequence)

  #text(event.description)
]

= State Variables <state_variables>

#for state_variable in state_variables.values() [
  === #text(state_variable.name) (#raw(state_variable.acronym))
  #label("state_variable_" + state_variable.identifier)

  #text(state_variable.description)

  Type: #link(label("type_" + state_variable.type), state_variable.type)
  #if (state_variable.type == "Real") [
    #todo(
      "Real numbers don't exist in computers. We need to change this type. Most likely to an amount of money.",
    )
  ]
  #if (state_variable.type == "Enum") [
    with allowed values:
    #for allowed_value in state_variable.allowedValues [
      - #raw(allowed_value.acronym) (#text(allowed_value.name)) #label(
          "state_variable_" + state_variable.identifier + "_allowed_value_" + allowed_value.identifier,
        )

        #text(allowed_value.description)

    ]
  ]
]

= Contracts <contracts>

#for contract in contracts.values() [
  === #text(contract.name) (#raw(contract.acronym))
  #label("contract_" + contract.identifier)

  Status: #text(
    contract.at("status", default: dict_todo("No status for this contract")),
  )

  Coverage: #text(
    contract.at("coverage", default: dict_todo("No coverage for this contract")),
  )

  Family: #text(contract.family)

  Class: #text(contract.class)

  #text(contract.description)

  #todo("Relevant terms")

  #let applicability = applicability_map.at(contract.identifier, default: (:))

  #if applicability.len() == 0 [
    #dict_todo("No applicability rules for this contract.")
  ] else [
    ==== Applicable terms
    #for term in terms.values() [
      #let rule = applicability.at(term.identifier, default: "")
      #if rule != "" [
        #let rule_description = if rule == "x" [ Optional ] else { if rule == "NN" [ Required ] else { text(rule) } }
        - #link(label("term_" + term.identifier), text[#(term.name) (#raw(term.identifier))]): #text(rule_description)
      ]
    ]
  ]

  ==== Allowed events
  #if (contract.acronym == "PAM") [
    - #IED
    - #FP
    - #MD
    - #AD
    - #PP
    - #PY
    - #PRD
    - #TD
    - #IP
    - #IPCI
    - #RR
    - #RRF
    - #SC
    - #CE
  ] else [
    #todo("Allowed events")
  ]
  ==== Required State Variables
  #if (contract.acronym == "PAM") [
    ===== #Md
    Initial value: value of the #MD contract attribute

    ===== #Nt
    If the contract's #IED is greater than $t_0$, then the initial value is $0.0$.
    Otherwise the initial value is $R(#raw("CNTRL")) dot #raw("NT")$.

    ===== #Ipnr
    If the contract's #IED is greater than $t_0$, then the initial value is $0.0$.
    Otherwise the initial value is the value of the #IPNR contract attribute.

  ] else [
    #todo("Required state variables")
  ]

  #todo("Schedule with comments")

  #todo("Variable initialisation")

  #todo("State Transition & Payoff function")

  // TODO make examples for all contracts
  #if (contract.identifier == "annuity") [
    #examples("contracts/" + contract.identifier)
  ]
]

