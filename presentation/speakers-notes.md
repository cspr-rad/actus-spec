# ACTUS Specification 2.0 speaker's notes.

These are the speaker's notes that accompany the presentation of the same name.
Please find the presentation `.pdf` file to give this presentation.
You can use `pdfpc` to give this presentation.


## Why are we talking about this?

We are a team from Casper, trying to implement ACTUS in a zero-knowledge context.
When we started off trying to build a Rust implementation, we ran into some
issues and noticed some room for improvement.

Today we'd like to point out these issues and propose some improvements.


## Current situation

This diagram shows the current situation of the ACTUS specification.
There is an Excel sheet contains the information about contract types, terms,
state variables, applicability, etc
This sheet comes with a `create-dictionary.R` script that lets you turn it into
a `.json` blob.
There is also a java implementation that co-evolved with the Excel sheet, but
is inconsistent with it in various ways.
There is also a specification pdf that is more or less independent of the
dictionary, and only specifies the mathematical definition of state transitions
and payoffs.
It means that the source of truth is .. all of these together.

Then we come along and want to write a Rust implementation and think "Where do we start?"
We started by looking at the specification pdf and noticed that it was missing most of the specification.
We then looked at the dictionary and found that is was also missing certain pieces.
So we looked at the java implementation as well, and noticed that it was inconsistent with the dictionary.

Clearly some things had gone wrong despite some very smart people making a well-intentioned effort.

## Our proposals

We will propose a few things.
Each of these are optional, and they are in order of importance.

*list the proposals* in one sentence each.

We will explain them one by one now.

# Single-source of truth.

The first proposal is to have a single source of truth.

Why is this important?
The most important reason is avoid inconsistencies by making in clear which behaviour is expected.
When there are multiple sources of truth, they eventually diverge.

We propose to designate one document as _the_ source of truth.

Then we can base implementations, tests, and documentation on it.

# Fix important issues in the spec

There are some important problem with the current specification.
They describe data types like "Real number" and "Timestamp".
Timestamps are complicated. Which granularity? Which time zone? Leap seconds?
Real numbers are an even bigger problem because they don't even exist in computers.

There are also some keys missing in the dictionary, and some broken references in the spec, but these are easy to fix once there is a single source of truth.


# Specify machine-readable tests

There are already some machine-readable tests, but we would like to propose that
* The spec describes what tests look like
* The spec comes with some tests that an implementation must pass in order to be call an implementation

This has some benefits:
* Tests become data that we can share and improve on
* We can write a test generator to continuously test an implementation

# Make the specification with typst

The specification is currently written in LaTeX and then compiled to a pdf.

* Free & Open-source
* Modern alternative to LaTeX
* Fast incremental compilation
* Excellent error messages

# Get rid of the Excel sheet

Excell is closed-source, binary (hard to version-control) format.
This would help lessen the confusion around what is the source of truth.

If you really need an excel sheet then it'd be best to generate that.

# Proposed situation

This is our proposed situation.
Note that all arrows are going from the GitHub repository outward.

The source of truth here is the combination of the dictionary data, the specification in typst source, and the manually written test data.

# Current situation

We currently have a draft specification document written in typst, as well as
some proposed test data.
The draft specification is ready enough to make the decision about which of
these proposals to adopt, but not for any other purpose.

To continue this work, we need a big "OK, let's do it", and maybe some
commitments about who wants to help, if anyone does.
I wouldn't mind doing all the work, but we still need to come to an agreement
to adopt the new specification together.

# Future work

Here are some next steps that we can take when/if we agree to go this way.
The first important step will be to describe what we want a test to look like.
I would like to work together with someone who knows about the current test
data to do that.

Next comes some annoying work, but maybe we can automate some of it.
If we choose to use Typst, then we need to rewrite the LaTeX formulas in Typst.
I wouldn't mind doing this myself because I have written a LOT of LaTeX.
If instead we choose to use LaTeX, then we need to rewrite what we currently
have in Typst, in LaTeX.
I'd prefer to not do this because LaTeX makes what we've done in Typst quite
complicated.

Once tests are specified, we can write a test generator to keep implementations
in agreement.

We can then also make a documentation generator that can make a nice website
from the dictionary and test data.

# References

Here are some more references.
The first is the repository with this presentation and the new specification work.
The second is a blog post that details the recommended way to work with money in software.
