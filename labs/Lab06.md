---
layout: default
title: "Fuzzing with AFL"
type: Lab
number: 06
active_tab: lab
release_date: 2024-02-22
due_date: 2024-02-29 23:59:00EDT
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
This lab is optionally completed in partners. If you complete this lab with a partner, submit only once to gradescope. It will be due Sunday March 23rd. 

## Objectives:

In this lab you will explore fuzzing C programs with AFL. You will run AFL on a small set of toy programs and record the time taken to find a crash.

## PART 1: Manually Crash the Programs

In this part of the assignment, you will use AFL++ to fuzz C programs. 

Follow the instructions from the [Lecture 13 Class Activity](activity.html) to manually crash the given programs. Record the inputs that you manually derived.

For this lab, download an additional file: 

`wget https://bmc-cs-software-analysis.github.io/383/labs/lab06/parse_json.c`


## Part 2: Crash the Programs with AFL

In this part, you will run AFL to generate inputs which crash the programs you manually crashed in the previous step.

### Setup
1. ssh into goldengate
2. From goldengate, `ssh USERNAME@atria.cs.brynmawr.edu`
3. `sudo docker run -ti -v FULL_PATH_TO_THIS_ACTIVITY:/src aflplusplus/aflplusplus`

If you run `ls /src/` you should see the downloaded files.

Compile your program with the AFL version of c. This will instrument your program to log coverage: `/AFLplusplus/afl-clang-fast -o easy1 easy1.c`

AFL++ requires a seed program. For now, create a directory `seed` and with a file `iput1.txt` that contains the text "test".

Run AFL with: `/AFLplusplus/afl-fuzz  -i seeds/ -o out/ -- ./easy1`

Monitor the output and record the time taken to find each crash. The crashing input will be located in `out/default/crashes`. Record this. Is it different than the one you derived manually? Record your results and save them. You 

Do this for each of the target programs you downloaded, including the JSON parser.

## Part 3: Smart Seeds

In this part of the lab, you will experiment with adding seed programs and investigating their effect on the time for AFL to find a crash.

For each target program, add a seed to the `seed` directory which exemplifies a "normal" input to the program. It should be similar to the crashing input, but should itself be non-crashing. 

Run AFL again on each target and report the time to crash.


# Summary

Submit a lab report with the following to Gradescope:
1. Manual crashes for the seven target programs (including `parse_json`)
2. AFL's discovered crashes for all target programs and the time to crash
3. Your seeds from Part 3 and the time to crash. Calculate the difference between time to crash in Part 2 and time to crash when your seeds were used.
4. Which programs took the longest to find a crash? why?
5. Which programs were the quickest to crash? why?
6. Which programs benefitted the most from providing a seed? why?
