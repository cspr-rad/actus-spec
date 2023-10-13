
= ACTUS Specification version 2

This document represents a revision of the ACTUS specification.
It focusses on a lack of ambiguity and helping with practical implementations. 

The specification describes multiple contract types.
For each contract type, it first describes the specification, then examples, and finally test cases.
These test cases are machine readible such that each implementation can use them to test itself.
We also provide a test harness that any implementor can use to test their implementation against arbitrary test cases.

#let todo(str) = box({
  text(blue, "TODO: ")
  text(str)
})
#let citation_needed = todo("[CITATION NEEDED]")

== Prelude

=== Note on terminology

#show "must": raw("MUST")
#show "must not": raw("MUST NOT")
#show "should": raw("SHOULD")
#show "should not": raw("SHOULD NOT")

should, should not, must, must not, ... #todo("refer to that rfc")

=== Data Types

While the original ACTUS specification describes contract schedules using mathematical notation and, in particular, real numbers, we want to take a more practical and exact approach.
Describing numbers or even amounts of money as real numbers is not helpful for implementors.
Indeed, real numbers cannot be represented in computers.
Even representing fractiol numbers has its issues #citation_needed.

We will therefore specify the exact data types that implementations can use to adhere to the specification.
In particular, this specification aims to describe exactly how implementations must behave when precision is lost due to the reality of working in a finite amount of time and space.

==== Amounts of money

For each currency, a minimal quantisation must be defined.
For example, the minimal quantisation of USD may be defined as 1 cent.

The quantisation factor is defined as the number of minimal quantisations that represent one unit of the currency.
For example, The quantisation factor of USD is then 100, because 100 cents equals one USD.

Amounts of money must be represented as an integral amount of a given minimal quantisation of its currency.
(An amount of money must_not be represented as a floating point number, or an arbitrary-precision rational number.)
For example, one USD can be represented as `100` cents if the quantisation factor is chosen to be 100.

#todo("Specify i64 vs i128. Are 128 bits necessary? Probably, if people choose their quantisation factor too large or we want to future-proof against inflation(?).")

#todo("Specify i64 vs u64: we probably want separate types for positive amounts and possibly-negative amounts.")

==== Day

A day is represented as an unsigned integral number of days since 1970-01-01.
#todo("Specify the minimum range for a datatype that is used.")

==== Time of day

A time of day is represented as an integral number of microseconds since the start of the day.
#todo("Figure out if that's too much precision. Maybe we don't care about sub-second timing.")

==== Local datetime

A datetime is a tuple of a day and a time of day.

==== Timezone offset

A timezone offset is represented as an integral number of minutes away from UTC #todo("Double-check that it's UTC and not GMT?")
Note that a timezone offset is only valid within a timezone at a given time

==== Timezone

A timezone, in theory, is a function from local datetimes without timezone offset, to timezone offsets.
#todo("Refer to the timezone database to describe how this mapping works in practice")



== Contract concepts
=== Events
=== Schedules
=== State
=== State

== Events

#todo("put all the dictionary info in this document in a 'correct by construction' way so that we can generate the dictionary instead of writing it separately")

#let IED={ link(label("IED"), "IED (Initial Exchange Date)") }
=== #IED <IED>


#let FP={ link(label("FP"), "FP (Fee Payment)") }
=== #FP <FP>

#let PR={ link(label("PR"), "PR (Principal Redemption)") }
=== #PR <PR>

#let PD={ link(label("PD"), "PD (Principal Drawing)") }
=== #PD <PD>

#let PRF={ link(label("PRF"), "PRF (Principal Payment Amount Fixing)") }
=== #PRF <PRF>

#let PY={ link(label("PY"), "PY (Penalty Payment)") }
=== #PY <PY>

#let PP={ link(label("PP"), "PP (Principal Prepayment)") }
=== #PP <PP>

#let IP={ link(label("IP"), "IP (Interest Payment)") }
=== #IP <IP>

#let IC={ link(label("IC"), "IC (Interest Capitalization)") }
=== #IC <IC>

#let AD={ link(label("AD"), "AD (Monitoring)") }
=== #AD <AD>

#let IPCI= { link(label("IPCI"), "IPCI (Interest Capitalization)") }
=== #IPCI <IPCI>

#let CE= { link(label("CE"), "CE (Credit Event)") }
=== #CE <CE>

#let RRF= { link(label("RRF"), "RRF (Rate Reset Fixing with Known Rate)") }
=== #RRF <RRF>

#let RR= { link(label("RR"), "RR (Rate Reset Fixing with Unknown Rate)") }
=== #RR <RR>

#let DV= { link(label("DV"), "DV (Dividend Payment)") }
=== #DV <DV>

#let PRD= { link(label("PRD"), "PRD (Purchase)") }
=== #PRD <PRD>

#let MR= { link(label("MR"), "MR (Margin Call)") }
=== #MR <MR>

#let TD= { link(label("TD"), "TD (Termination)") }
=== #TD <TD>

#let SC= { link(label("SC"), "SC (Scaling Index Fixing)") }
=== #SC <SC>

#let IPCB= { link(label("IPCB"), "IPCB (Interest Calculation Base Fixing)") }
=== #IPCB <IPCB>

#let MD= { link(label("MD"), "MD (Maturity)") }
=== #MD <MD>

#let XD= { link(label("XD"), "XD (Exercise)") }
=== #XD <XD>

#let STD= { link(label("STD"), "STD (Settlement)") }
=== #STD <STD>

== State Variables
== Contracts

#let PAM= { link(label("PAM"), "PAM (Principal at Maturity)") }
=== #PAM <PAM>

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
