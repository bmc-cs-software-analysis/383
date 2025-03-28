---
layout: default
title: Formal Verification
type: Lab
number: 08
release_date: 2025-03-31
due_date: 2025-04-06 23:59:00EDT
---

{{page.type}} {{page.number}}: {{page.title}}
=============================================================


## Overview

In lab last week you explored formal verification using openJML - a tool that translates JML annotations to boolean fomulae and fed them to the SMT solver Z3 for verification. 

In today's lab, you'll explore another family of formal verification. In these techniques, the program is part of the proof. This provides stronger gaurantees. In the previous family, error could be introduced in parsing the annotations, generating the constraints, or writing strong verification conditions. By writing the program directly as part of the proof, it eliminates room for error.

### Resources
1. [Dafny Cheatsheet](https://docs.google.com/document/d/1kz5_yqzhrEyXII96eCF1YoHZhnb_6dzv-K3u79bMMis/edit?pref=2&pli=1&tab=t.0)

### Setup
To complete this lab, install the Dafny vscode extension.

## Part 1: Deductive Reasoning

### Problem 1: Condition Strength
Indicate the weakest condition in each set. Note: write "None" if the conditions are unrelated by implication.
1.  
    ```
    { -1 ≤ x ≤ 1 }

    { 0 ≤ x ≤ 1 }

    { x = 0 }
    ```


2. 
    ```
    { x > 0 ∧ y ≥ 0 }

    { x > 0 ∨ y > 0 }
    ```

3. 
    ```
    { |x| > w }

    { x > w }
    ```
4.

    ```
    { |x| > |w| }

    { x > w }
    ```
5.

    ```
    { x is int }

    { x is real }
    ```


### Problem 2: Hoare Triples

State whether each Hoare triple is valid. If invalid, explain why and show how to modify the precondition or postcondition to make it valid.

1. 

```
{ z ≤ 0 }
x = 2 * z;
{ x ≤ 1 }
```

2. 

```
{ z > x }
y = z - x;
{ y ≤ 0 }
```


### Problem 3: Forward Reasoning with Assignment Statements
Find the strongest postcondition for each code sequence, inserting the appropriate condition in each blank.

```
{ x > z }
y = y - z;
{ _______________________________ }
y = y + 2;
{ _______________________________ }
```

```
{ z*z < 64 }
z = -z;
{ _______________________________ }
z = z / 2;
{ _______________________________ }
z = z + 4;
{ _______________________________ }
```

```
{ x is odd }
y = x * x;
{ _______________________________ }
w = y mod 4;
{ _______________________________ }
```

### Problem 4: Backward Reasoning with Assignment Statements
Find the weakest precondition for each code sequence.

```
{ ___________________________ }
z = x - 4;
{ ___________________________ }
y = z + x;
{ y ≤ 0 }
```

```
{ ___________________________ }
x = 2 * w + 8;
{ ___________________________ }
z = 2 * z;
{ z > x }

```

### Problem 5: Backward Reasoning with If/Else Statements

Find the weakest precondition for the conditional statement below using backward reasoning.

```
{ ___________________________ }
if (x ≤ 0)
    { ___________________________ }
    x = x * x;
    { ___________________________ }
else
    { ___________________________ }
    x = x + 1;
    { ___________________________ }
{ x ≠ 0 }
```

### Problem 6: Verifying Correctness

For each block of code, fill in intermediate conditions and determine if the precondition guarantees the postcondition. Use forward and backward reasoning as appropriate.

1. 
```
{ z > 1 }
y = z - 1;
{ ___________________________ }
w = 2 * y;
{ ___________________________ }
w = w + 1;
{ w > 1 }
```

2. 
```
{ x ≥ w }
w = w / 2;
{ ___________________________ }
z = 2 * w + 2;
{ ___________________________ }
x = x + 2;
{ ___________________________ }
y = x;
{ y ≥ z }
```

3. 
```
{ y > 0 }
if (x == y)
    { ___________________________ }
    x = -1;
    { ___________________________ }
else
    { ___________________________ }
    x = y - 1;
    { ___________________________ }
{ x < y }
```

### Problem 7: Loops
1.  State a suitable loop invariant

```
{ x ≥ 0 }
int i = x;
int p = 0;
while (i != 0) {
  p = p + y;
  i = i - 1; 
}
{ p = x * y }
```

2.  Write a loop that computes the minimal value in a non-empty array of integers.
State a suitable loop invariant.


Starter code is given:
```
{ arr != null ∧ arr.Length > 0 }
i = 0;
z = arr[0];
while ( ... ) {
  ...
}
{ forall k :: 0 <= k < arr.Length ==> arr[k] >= z }
```


## Part 2: Dafny
Download `math.dfy`  with:
`wget https://bmc-cs-software-analysis.github.io/383/activities/math.dfy`

First, inspect the pre and post conditions for both methods. 

Try to change the implementation of `square` so it does not match the specification. The Dafny should report an error in the IDE:
`error: this postcondition may not hold`

Next, try to modify the pre-and post conditions on `Divide` and see what Dafny reports.

###  Conditionals

Implement a method `method Abs(x: int)` that returns the absolute value of x and uses a conditional statement in its implementation.

Add a postcondition to ensure the result is nonnegative and equal to either x or -x.


###  Loops

Implement a method `SumUpTo(n: nat)` that returns the sum of all integers from 1 to n.
Use a while loop.
Include appropriate loop invariants and a postcondition that ensures the result is equal to `n*(n+1)/2`.

## Part 3: Verifying the conditions you derived by hand

Verify the specifications you derived in Problems 3, 4, and 5 of Part 1 with Dafny.


### Submission:
Submit the following files to gradescope:

1. `math.dfy`
2. Your answers to part 1
3. Dafny code for part 3

