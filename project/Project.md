---
layout: default
title: "Automated Bug Finding: Enhancing Test Generation for Real-World Java Bugs"
type: Project
number: 00
active_tab: project
release_date: 2025-02-16

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



{{page.type}}: {{page.title}}
=============================================================

Automated testing aims to generate tests which find bugs, prevent regressions and provide documentation. In this project, we will target bug finding as a use case for test generation.

In general there are two types of bugs:
1. safety property violations
2. functional property violations

Tests consist of a prefix and an assertion. In order to find a bug, the prefix must set up state and exercise the buggy part of the code. Furthermore, the assertion must assert the correct behavior which the bug violates. 

In this project you will run state of the art automated testing tools to attempt to find bugs in a benchmark. You will record the current state of the art as a baseline and attempt to approve upon it. 

Each group will be assigned a project from the Defects4J benchmark.

## Objectives:

In this project, you will....

1. Run the testing tool and EvoSuite
2. Observe its outputs on the Defects4J benchmark and analyze strength and weaknesses
3. Improve upon the outputs on your target project

## Important Dates:
1. Groups formed by Mar 17th at midnight
2. Part1 due Mar 31st
3. Part2 April 7th
4. Check in during lab April 21st
5. Final Report due April 30th

# Part 1: Due March 31st

### Bug Assignments:

Each group will be assigned a project from Defects4j and range of bugs.

### Part A: Inspection of each sample 

For each bug, inspect the bug and the developer written trigger test. Relevant instructions are included in Labs 4 and 5. You will need to checkout your bug using `defects4j checkout` and open it in an IDE of your choice. The [Defects4j dissection](https://program-repair.org/defects4j-dissection/#!/) site will be useful for this project. 

### Part B: Prefix Generation

Experiments involving randomness should be repeated and averaged to account for the variability in outcomes caused by the randomness itself. Run each experiment for 3 trials with a search budget of 2 minutes each.

For each bug, in how many trials was the buggy branch executed? Was it executed with a bug-triggering input?

**Success Analysis**
Highlight the bugs for which we found success. Of the ones that did cover the bug, why? Was it a small search space?

**Error Analysis**
Of the ones that did not cover the bug, why not? What would it have taken to make it cover it? Was it in the test cluster? Large search space?

### Part C: Assertion Generation
Generate the 3 assertions using EAS2 approach? But run the real tool:
https://github.com/Lhy-apple/editas2

### Part D: Report
Compile all of your results into a [latex document](https://www.overleaf.com/read/skgqsjtdprhz#2b546f) with your group. 


# Part 2: Due April 7th

In this part, you will use your report to propose an improvement to either EvoSuite or the Assertion Generation. Your proposal should directly make use of your error analysis. More instructions coming!

# Part 3: Due April 30th

In this part you will implement your proposed improvement and discuss results. More instructions coming!
