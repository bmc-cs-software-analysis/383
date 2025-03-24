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
1. [why3](https://www.why3.org/doc/index.html)

### Setup
Complete this activity on atria
0. ssh to goldengate then to `atria.cs.brynmawr.edu`
1. `opam install why3`
2. `opam init`
3. `eval $(opam env)`

## Part 0: Hello Proof

```
theory HelloProof

  goal G1: true

  goal G2: (true -> false) /\ (true \/ false)

  use int.Int

  goal G3: forall x:int. x * x >= 0

end
```

## Part 1: Einsteins's Problem
https://www.why3.org/doc/whyml.html

## Part 2: Sum and Maximum

## Part 3: Searching a Linked List

