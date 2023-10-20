// Helper functions for writing
#let todo(str) = box({
  text("TODO: ", blue)
  text(str)
})
#let citation_needed = todo("[CITATION NEEDED]")

// Data import
#let dictionary = json("dictionary.json")

#todo(
  "Maybe we find a way to do these declarations (look in main.typ) for each event automatically? Perhaps we could just be required to write event(\"monitoring\") instead of #AD",
)

#let terms = dictionary.at("terms")

#let make_term_label(identifier) = {
  let term = terms.at(identifier)
  [ #link(
      label("term_" + term.identifier),
      [ #raw(term.acronym) (#text(term.name)) ],
    ) ]
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

#let events = dictionary.at("events")

#let make_event_label(identifier) = {
  let event = events.at(identifier)
  [ #link(
      label("event_" + event.identifier),
      [ #raw(event.acronym) (#text(event.name)) ],
    ) ]
}

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

#let state_variables = dictionary.at("state-variables")
#let make_state_variable_label(identifier) = {
  let state_variable = state_variables.at(identifier)
  [ #link(
      label("state_variable_" + state_variable.identifier),
      [ #raw(state_variable.acronym) (#text(state_variable.name)) ],
    ) ]
}

#let IPAC = make_state_variable_label("accruedInterest")
#let IPAC2 = make_state_variable_label("accruedInterest2")
#let PRF = make_state_variable_label("contractPerformance")
#let XA = make_state_variable_label("exerciseAmount")
#let XD = make_state_variable_label("exerciseDate")
#let FEAC = make_state_variable_label("feeAccrued")
#let ICBA = make_state_variable_label("interestCalculationBaseAmount")
#let SCIP = make_state_variable_label("interestScalingMultiplier")
#let MD = make_state_variable_label("maturityDate")
#let PRNXT = make_state_variable_label("nextPrincipalRedemptionPayment")
#let IPNR = make_state_variable_label("nominalInterestRate")
#let IPNR2 = make_state_variable_label("nominalInterestRate2")
#let NPD = make_state_variable_label("nonPerformingDate")
#let NT = make_state_variable_label("notionalPrincipal")
#let NT2 = make_state_variable_label("notionalPrincipal2")
#let SCNT = make_state_variable_label("notionalScalingMultiplier")
#let SD = make_state_variable_label("statusDate")
#let TD = make_state_variable_label("terminationDate")

#let contracts = dictionary.at("contracts")

#let make_contract_label(identifier) = {
  let contract = contracts.at(identifier)
  [ #link(
      label("contract_" + contract.identifier),
      [ #raw(contract.acronym) (#text(contract.name)) ],
    ) ]
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

= ACTUS Specification version 2

This document represents a revision of the ACTUS specification. It focusses on a
lack of ambiguity and helping with practical implementations.

The specification describes multiple contract types. For each contract type, it
first describes the specification, then examples, and finally test cases. These
test cases are machine readible such that each implementation can use them to
test itself. We also provide a test harness that any implementor can use to test
their implementation against arbitrary test cases.

== Prelude

=== Note on terminology

#show "must": raw("MUST")
#show "must not": raw("MUST NOT")
#show "should": raw("SHOULD")
#show "should not": raw("SHOULD NOT")

should, should not, must, must not, ... #todo("refer to that rfc")

=== Data Types

While the original ACTUS specification describes contract schedules using
mathematical notation and, in particular, real numbers, we want to take a more
practical and exact approach. Describing numbers or even amounts of money as
real numbers is not helpful for implementors. Indeed, real numbers cannot be
represented in computers. Even representing fractiol numbers has its issues #citation_needed.

We will therefore specify the exact data types that implementations can use to
adhere to the specification. In particular, this specification aims to describe
exactly how implementations must behave when precision is lost due to the
reality of working in a finite amount of time and space.

==== Enum <type_Enum>

When a value is of an enum type, the allowed values are specified.

==== Real <type_Real>

#todo(
  "Real numbers don't exist in computers. We must get rid of this section.",
)

==== Amounts of money <Amount>

For each currency, a minimal quantisation must be defined. For example, the
minimal quantisation of USD may be defined as 1 cent.

The quantisation factor is defined as the number of minimal quantisations that
represent one unit of the currency. For example, The quantisation factor of USD
is then 100, because 100 cents equals one USD.

Amounts of money must be represented as an integral amount of a given minimal
quantisation of its currency. (An amount of money must_not be represented as a
floating point number, or an arbitrary-precision rational number.) For example,
one USD can be represented as `100` cents if the quantisation factor is chosen
to be 100.

#todo(
  "Specify i64 vs i128. Are 128 bits necessary? Probably, if people choose their quantisation factor too large or we want to future-proof against inflation(?).",
)

#todo(
  "Specify i64 vs u64: we probably want separate types for positive amounts and possibly-negative amounts.",
)

==== Day

A day is represented as an unsigned integral number of days since 1970-01-01.
#todo("Specify the minimum range for a datatype that is used.")

==== Time of day

A time of day is represented as an integral number of microseconds since the
start of the day.
#todo(
  "Figure out if that's too much precision. Maybe we don't care about sub-second timing.",
)

==== Local datetime

A datetime is a tuple of a day and a time of day.

==== Timezone offset

A timezone offset is represented as an integral number of minutes away from UTC #todo("Double-check that it's UTC and not GMT?")
Note that a timezone offset is only valid within a timezone at a given time

==== Timezone

A timezone, in theory, is a function from local datetimes without timezone
offset, to timezone offsets.
#todo(
  "Refer to the timezone database to describe how this mapping works in practice",
)

==== Timestamp <type_Timestamp>

#todo(
  "What does a timestamp mean in the actus spec? which granularity? which Timezone? leap seconds? Are we sure it's not a 'Day' instead?",
)

== Contract concepts
=== Terms
=== Events
=== Schedules
=== State

== Terms

#for term in terms.values() [
  === #text(term.name) (#raw(term.acronym)) #label("term_" + term.identifier)
  #text(term.description)

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
]

== Events

#for event in events.values() [
  === #text(event.name) (#raw(event.acronym)) #label("event_" + event.identifier)
  #text(event.description)
]

== State Variables

#for state_variable in state_variables.values() [
  === #text(state_variable.name) (#raw(state_variable.acronym)) #label("state_variable_" + state_variable.identifier)

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

== Contracts

#for contract in contracts.values() [
  === #text(contract.name) (#raw(contract.acronym)) #label("contract_" + contract.identifier)

  Coverage: #text(contract.coverage)

  Family: #text(contract.family)

  Class: #text(contract.class)

  #text(contract.description)

  #todo("Relevant terms")
  #todo("Allowed events")
  #todo("Required state variables")
]

=== #PAM <PAM>

==== Relevant terms

==== Allowed events

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

==== Required state variables

- #MD
- #NT
- #IPNR
