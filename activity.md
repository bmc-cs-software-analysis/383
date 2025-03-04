---
layout: default
title: Fuzzing
type: In Class Activity
number: 02
release_date: 2025-03-04
---

{{page.type}} {{page.number}}: {{page.title}}
=============================================================


## Overview

In this activity, you'll explore randomized testing for C programs.  

## Resources
1. [AFL++](https://aflplus.plus/)

## PART 1: Fuzzing with AFL

In this part of the assignment, you will use AFL++ to fuzz C programs. For parts one and two, you will be testing the target C programs in the `hw04/c_targets/` directory. 

First, to gain familiarity, take a look at each of the sample programs.

Let's start with the simplest program: `sanity1.c`

```C
int main() {
  char input[65536];
  fgets(input, sizeof(input), stdin);
  int x = 0;
  int y = 2;
  int z = y / x;
  return 0;
}
```

This program will crash with a divide-by-zero error regardless of what is supplied in stdin.

Try it out by running `./sanity1 <YOUR STD IN INPUT>` 

You should see a crash. Furthermore, when you run `ls` you should now see a `sanity1.cov` file. Code coverage is a measure of how much of a program’s code is executed in a particular run. There are a number of different criterias to describe coverage. In this assignment we are providing line and column coverage. You may notice that some locations are printed more than once. This is because coverage is calculated at the *instruction level*. For more information on instructions and how coverage is calculated, you can read this [LLVM primer](https://drive.google.com/file/d/1Vwdan96-bGiGsww4HYnqhW_fXycaOkvN/view). 

Inspect the rest of the target files. Try to come up with a crashing input and run them and inspect the coverage. 

Record the crashing inputs you manually derived, and report them in your `README.txt`.

> TODO FIX PATH{1,2,3} FILES so they don't have to come up with an input that's 140 length


The target programs `easy{n}.c`, and `path{n}.c`, are sample programs contrived for this assignment. We've also included `CVE-{year}-{n}.c` files. A CVE, or Common Vulnerabilities and Exposures, identifier is a unique reference number given to a publicly known cybersecurity vulnerability. The CVE identifier follows a specific format: **CVE-[Year]-[Number]**.

- **Year**: This part of the identifier indicates the year the vulnerability was discovered or made public. It reflects when the CVE ID was assigned, not necessarily when the vulnerability was found.
  
- **Number**: This is a sequential number assigned to the vulnerability within that year. The number typically starts from 1 and goes upwards as new vulnerabilities are identified throughout the year.

For example, in the identifier **CVE-2024-12345**:
- "2024" is the year the CVE was assigned.
- "12345" is the unique number of that vulnerability for the year 2024.

This system helps track and reference specific vulnerabilities in a standardized way. 

The CVE programs you will test are minimal code semgents inspired by the denotated real world vulnerability.

Now that you're familiar with the target programs and their bugs, let's use AFL to fuzz them. 


Setup steps: [@eliz TODO: ask David to install on goldengate] https://github.com/AFLplusplus/AFLplusplus/blob/stable/docs/INSTALL.md

Record the time taken to find each bug.... 

Also record the crashing input. Is it different than the one you derived manually? Record your results in the README.

