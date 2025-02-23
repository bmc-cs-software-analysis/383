---
layout: default
title: "EvoSuite"
type: Lab
number: 05
active_tab: lab
release_date: 2025-02-24

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

This lab is optionally a partner assignment. Make sure your document specifies if you worked with a partner.

## Objectives:

In this lab, you will explore Search Based Test Generation with Genetic Algorithms using EvoSuite. Similar to Lab4, you will run EvoSuite on a real-world bug in the Defects4j benchmark.

## Part 1 - EvoSuite on a small example

Plot coverage?

## Part 2 - EvoSuite on Defects4J 
Chart 1?

## Submission 
Submit a document answering the following questions to Gradescope:

1. Part 1: Your fixed <FILES>  and the coverage plot.
3. Part 2: EvoSuite Results for your bug. Include the number of tests generated, if any trigger the bug, and the line and branch coverage.
4. Discuss differences between the EvoSuite generated tests and the developer written test.
5. Discuss differences between the EvoSuite and Randoop generated tests from Lab 4.

Remember to clearly indicate if you worked with a partner on this assignment.


