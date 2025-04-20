---
layout: default
title: "Static Analysis"
type: Lab
number: 10
active_tab: lab
release_date: 2025-04-28
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
This lab is optionally completed in partners. If you complete this lab with a partner, submit only once to gradescope. It will be due Sunday May 4th. 

## Objectives:
The main goals for this lab are:


## Part 1: 
For the Control Flow Graph below,
fill in Reaching Definitions gen and kill sets, and in and out sets for each node. The in and
out sets show the final solution of fixpoint iteration, not an intermediate value.

![p1](/383/labs/lab10/p1.png)

## Part 2: SpotBugs

# Submission
Your report should include answers to the following questions:

1. Provide a discussion regarding the "checkers". Are these safety or functional properties? Put this in context to the assertion generation lectures and assignments.

2. How did you inject a FP?
