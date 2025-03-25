---
layout: default
title: Formal Verification
type: In Class Activity
number: 03
release_date: 2025-03-04
---

{{page.type}} {{page.number}}: {{page.title}}
=============================================================


## Overview

In lab on Monday you explored formal verification using openJML - a tool that translates JML annotations to boolean fomulae and fed them to the SMT solver Z3 for verification. 

In this activity, you'll explore another family of formal verification. In these techniques, the program is part of the proof. This provides stronger gaurantees. In the previous family, error could be introduced in parsing the annotations, generating the constraints, or writing strong verification conditions. By writing the program directly as part of the proof, it eliminates room for error.

### Resources
1. [Dafny Cheatsheet](https://docs.google.com/document/d/1kz5_yqzhrEyXII96eCF1YoHZhnb_6dzv-K3u79bMMis/edit?pref=2&pli=1&tab=t.0)

### Setup
To complete this activity, install the Dafny vscode extension.

## Part 0: Math
Download `math.dfy`  with:
`wget https://bmc-cs-software-analysis.github.io/383/activities/math.dfy`

First, inspect the pre and post conditions for both methods. 

Try to change the implementation of `square` so it does not match the specification. The Dafny should report an error in the IDE:
`error: this postcondition may not hold`

Next, try to modify the pre-and post conditions on `Divide` and see what Dafny reports.

## Part 1: Conditionals

Implement a method `method Abs(x: int)` that returns the absolute value of x and uses a conditional statement in its implementation.

Add a postcondition to ensure the result is nonnegative and equal to either x or -x.


## Part 2: Loops

Implement a method `SumUpTo(n: nat)` that returns the sum of all integers from 1 to n.
Use a while loop.
Include appropriate loop invariants and a postcondition that ensures the result is equal to `n*(n+1)/2`.


