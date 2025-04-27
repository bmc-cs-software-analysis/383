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
1. Practice reachability analysis by hand
2. Explore false positives and the reasons they arise

## Part 1: Reachability Analysis
For the Control Flow Graph below,
fill in Reaching Definitions gen and kill sets, and in and out sets for each node. The in and
out sets show the final solution of fixpoint iteration, not an intermediate value.

![p1](/383/labs/lab10/p1.png)

## Part 2: Numeric Analysis

Design an abstract domain for the example program we saw in class (Lecture 25). The abstract domain we explored led to a false positive at the assertion point (p7). Your abstract domain should be more precise and prevent a false positive.

```java
if (x == 0) {       // p1

       x--;            // p2

   } else if (x < 0) { // p3

       x = x + (-5);     // p4


   } else if (x > 0) { // p5

       x = x * 0;  // p6

   }

   assert(x <= 0); //p7
```


## Part 3: Fill out your course evaluation

These teaching evaluations are used for three purposes: 
    1) they provide feedback that should be helpful to the course instructor in general, or when this course is taught again; 
    2) they are reviewed by various faculty members in the evaluation of teaching when the College considers an instructor for reappointment, tenure, or promotion; 
    3) they provide information that helps the College evaluate larger curricular initiatives and goals. Both the instructor and the College appreciate thoughtful, candid, comments whether positive or negative, and constructive suggestions for improvement.  

Please spend 20 minutes responding to the questions on this form. Your answers will not be attributed to you. The instructor will see the results only after course grades have been submitted to the Registrar.


## Signing out

Submit the folowing to gradescope:
1. Your annotated CFG for Part 1.
2. Your annotated program (tracking abstract values of x) and your abstract domain for Part 2.
3. A confirmation that you've completed your course evaluation
