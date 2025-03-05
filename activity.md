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

## Setup
0. Download the target files with 
`wget https://bmc-cs-software-analysis.github.io/383/activities/sanity1.c`
`wget https://bmc-cs-software-analysis.github.io/383/activities/easy1.c`
`wget https://bmc-cs-software-analysis.github.io/383/activities/easy2.c`
`wget https://bmc-cs-software-analysis.github.io/383/activities/path1.c`
`wget https://bmc-cs-software-analysis.github.io/383/activities/path2.c`
`wget https://bmc-cs-software-analysis.github.io/383/activities/path3.c`
1. Install docker 
2. `sudo docker pull aflplusplus/aflplusplus:latest`
3. `sudo docker run -ti -v FULL_PATH_TO_THIS_ACTIVITY:/src aflplusplus/aflplusplus`

If you run `ls /src/` you should see the downloaded files.

## PART 1: Manually Crash the Programs

In this part of the assignment, you will use AFL++ to fuzz C programs. 

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

Try it out by compiling `g++ sanity1.c -o sanity1.out`
and running it `./sanity1 <YOUR STD IN INPUT>` 

Inspect the rest of the target files. Try to come up with a crashing input and run them and inspect the coverage. 

Record the crashing inputs you manually derived, and save them. You will submit them as part of Lab 6. 


## Part 2: Crash the Programs with AFL

Compile your program with the AFL version of c. This will instrument your program to log coverage: `/AFLplusplus/afl-clang-fast -o easy1 easy1.c`

AFL++ requires a seed program. For now, create a directory `seed` and with a file `iput1.txt` that contains the text "test".

Run AFL with: `/AFLplusplus/afl-fuzz  -i seeds/ -o out/ -- /src/easy1 @@`

Record the time taken to find each bug.... 

The crashing input will be located in `out/crashes`

Also record the crashing input. Is it different than the one you derived manually? Record your results and save them. You will also submit these as part of Lab 6. 

