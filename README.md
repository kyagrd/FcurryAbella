# Type preservation in the Curry-style System F using Abella

Thanks to Todd Wilson and Kaustav Chaaudhuri for their comments and
suggestions on the abella-theorem-prover mailing list.

For the first time in my life I have developed a fully mechanized proof for
type preservation of a polymorphic lambda calculus, which I can actually
understand the details, without having to rely on name binding libraries
which I don't fully understand (or, even if I understood the background theory,
often times either painfully tedious or equipped with tactis of black wizardary).
With the power of higher-order relational specification and framework for
context handling by two-level logic of Abella just makes it work (of course,
with some efforts to learn the syntax of lambda prolog and basic Abella
commands). Without importing any other libraries, the full mechaized proof
is less than 150 lines of Abella code including the specification and
definition files. This is so cool considering that Abella is not
equipped with very rich automated tactics as in Coq or Isabelle.

This has been contributed to the abella hompage examples.
See
http://abella-prover.org/examples/lambda-calculus/fcurry/fcurry.html
