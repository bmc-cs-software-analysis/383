---
layout: default
title: "Formal Verification"
type: Lab
number: 07
active_tab: lab
release_date: 2025-03-24

---

<!-- Check whether the assignment is ready to release -->
{% capture today %}{{'now' | date: '%s'}}{% endcapture %}
{% capture release_date %}{{page.release_date | date: '%s'}}{% endcapture %}
{% if release_date > today %} 
<div class="alert alert-danger">
Warning: this assignment is out of date.  It may still need to be updated for this year's class.  Check with your instructor before you start working on this assignment.
</div>
{% endif %}
<!-- End of check whether the assignment is up to date -->


<!-- Check whether the assignment is up to date -->
<!--{% capture this_year %}{{'now' | date: '%Y'}}{% endcapture %}
{% capture due_year %}{{page.due_date | date: '%Y'}}{% endcapture %}
{% if this_year != due_year %} 
<div class="alert alert-danger">
Warning: this assignment is out of date.  It may still need to be updated for this year's class.  Check with your instructor before you start working on this assignment.
</div>
{% endif %}-->
<!-- End of check whether the assignment is up to date -->



{% if page.materials %}
<div class="alert alert-info">
You can download the materials for this assignment here:
<ul>
{% for item in page.materials %}
<li><a href="{{item.url}}">{{ item.name }}</a></li>
{% endfor %}
</ul>

</div>
{% endif %}





{{page.type}} {{page.number}}: {{page.title}}
=============================================================

This lab is optionally completed in partners. If you complete this lab with a partner, submit only once to gradescope. It will be due Sunday March 30th. 

## Objectives:

In this lab you will formally verify programs by writing specifications that are translated to SMT formulae using OpenJML. 

### Setup:
1. Connect to goldengate
2. `wget https://github.com/OpenJML/OpenJML/releases/download/21-0.8/openjml-ubuntu-20.04-21-0.8.zip` and unzip it. 
3. run `./openjml` to verify you installed the tool correctly. You should see:
`Usage: openjml <options> <source files>
Use option '-?' to list options`

## Exercise 1 - Verifying MathUtils.square

The first program you will verify is a simple square method.
Download it: `wget https://bmc-cs-software-analysis.github.io/383/labs/lab07/MathUtils.java`

Let’s verify that the square method in MathUtils behaves correctly—that is, it returns a value equal to `x * x`. This condition is written as a postcondition in the file `MathUtils.java` 

Before running anything, take a moment to think:

- Is the postcondition always true?
- Can you think of any input for which the postcondition might not hold?

In traditional testing, we might generate random inputs and use assertions to check whether the postcondition holds. In this lab, however, we’ll go a step further—we’ll **formally verify** that the postcondition holds for *all* possible inputs using OpenJML.

Run the following command from your terminal:

```bash
openjml -esc -prover z3 MathUtils.java
```

You should see 3 verification failures.

The first error will state: The prover cannot establish an assertion in method square: int multiply overflow.

This means that an integer overflow might occur when computing x * x. Since Java’s int type has limited range, multiplying large values can exceed that range and wrap around, violating the postcondition.

In java, integer overflow occurs when an arithmetic operation tries to create a value that is outside the range that the int type can represent. In Java, the int type is a 32-bit signed integer. Its range is: -2,147,483,648 to 2,147,483,647. Consider the following program:

```java
int a = Integer.MAX_VALUE;
int b = a + 1;
System.out.println(b);  // Outputs: -2147483648 (Integer.MIN_VALUE)
```

Here, adding 1 to the maximum int wraps around to the minimum value — this is silent overflow. Java doesn't throw an error.

So, there are indeed some inputs for which the postcondition is not true. 
The values of x for which this method functions correctly are -46340 to 46340. This can be written as a precondition: `//@ requires -46340 <= x && x <= 46340;`

Try adding this as an annotation to `MathUtils.java` and rerun the verifier. You should see no output, which means your assertion is proven for all inputs that satisfy the precondition.


## Exercise 2 - Verifying SignUtils.sign

The next program you will verify is a simple sign method.
Download it: `wget https://bmc-cs-software-analysis.github.io/383/labs/lab07/SignUtils.java`

Verify that sign returns what we expect: If returns 1 if x is positive, -1 if x is negative, and 0 if x is 0. Write this as an `@ensures` JML postcondition and run openjml to verify it.

```bash
openjml -esc -prover z3 SignUtils.java
```

## Exercise 3 - Verifying BuyTicket.calculatePrice

Lastly, you will verify the `calculatePrice` program from labs 1-3. 

Downlaod a version of it for this lab: `wget https://bmc-cs-software-analysis.github.io/383/labs/lab07/BuyTicket.java`


Write annotations and verify them by running `openjml`.

### Submission Instructions:

Please submit the following files:

1. SignUtils.java with JML annotations
2. BuyTicket.java with JML annotations
3. Lab report which answers the following questions:
    a. What steps would be needed to formally verify the bug in Chart 1? What challenges or complications might arise during this process?
    b. Briefly compare the guarantees and trade-offs between testing and formal verification.

