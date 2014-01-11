# Russell

A (work-in-progress) ruby gem for deriving proofs in symbolic logic.

## Proposed API

    Russell.given(
      'A -> B',
      'A'
    ).prove('B')

    # =>  1. A -> B (given)
    #     2. A (given)
    #     2. B (-> elimination on 1, 2)

## How It Might Work

- Russell.given will generate an AssumptionSet object, which parses the givens and generates a syntax tree
- AssumptionSet.prove will first parse the proof, then apply logic (a magic step, I know--more below) to derive what you ask it to prove

## How To: Logic

I like [Dr. Math's 5 steps](http://mathforum.org/dr.math/faq/symbolic_logic.html#smallsteps) for applying the 12 rules of logical inference:

> Step 1: Find the main connective of the sentence you are trying to derive.
>
> Step 2: Apply the rule for introducing that main connective.
>
> Step 3: When you're in the middle of a derivation and you don't know what to do, find the main connective of the sentence you have and eliminate it.
>
> Step 4: Along the way you may have to derive subsentences using steps 1 through 3.
>
> Step 5: If all else fails, you may have to do a "~ elimination"

### The 12 Rules

#### Assumption

You can assume anything, but assumptions introduce a new scope. Nothing proven within an assumptions' scope can be used outside that scope. But, proving that something follows from an assuption lets you do things like the next rule:

#### -> Introduction

If you assume "X" and then prove "Y", you can now use "X -> Y" outside of the assumption's scope.

#### ^ Elimination

If you have "X ^ Y", then you're entitled to "X" and "Y".

#### Repetition

If you have "X", then you're entitled to "X". Duh.

#### ^ Introduction

If you have "X" and you have "Y", you're entitled to "X ^ Y"

#### -> Elimination

If you have "X" and you have "X -> Y", then you're entitled to "Y".

#### <-> Introduction

If you have "X -> Y" and also "Y -> X", then you're entitled to "X <-> Y".

#### <-> Elimination

If you have "X <-> Y" and you have "X", then you're entitled to "Y", and if you have "Y" then you're entitled to "X".

#### ~ Introduction

This rule requires you to prove something within the scope of an assumption. If you assume "X" and you can prove both "Y" and "~Y", then you're entitled to "~X" outside the scope of that assumption.

#### ~ Elimination

Likewise, if you assume "~X" and you can prove both "Y" and "~Y", then you're entitled to "X" outside the scope of that assumption.

#### v Introduction

If you have "X", then you're entitled to "X v Y".

#### v Elimination

If you have "X v Y", "X -> Z", and "Y -> Z", then you're entitled to Z.

## Why I Think This Can Work

12 steps. 5 (potentially nested) rules. This seems like something a computer should be able to apply brute force. And it'll be sweet revenge for all the hours I spent manually deriving logical proofs in my university days.

## Eventually...

- it should take efficiency into account and return the most efficient proof
- it should be able to derive logical truths from 0 assumptions
