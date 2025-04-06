---
layout: default
title: "Symbolic Execution"
type: Lab
number: 09
active_tab: lab
release_date: 2025-04-07

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
This lab is optionally completed in partners. If you complete this lab with a partner, submit only once to gradescope. It will be due Sunday April 13th. 

## Objectives:

In this lab you will run a symbolic executor on Java programs and observe its outputs. 

### Setup
1. Skip this step if you are running on goldengate.
    `git clone git@github.com:yannicnoller/jpf-core.git` 
    `git clone git@github.com:SymbolicPathFinder/jpf-symbc.git`
2. Create a propteries file with paths to the cloned repos:
    `mkdir ~/.jpf`
    `vim ~/.jpf/site.properties` and add the lines:
    `jpf-core=PATH TO CORE REPO`
    `jpf-symbc=PATH TO SYMBC REPO`
    `extensions+=,jpf-symbc`

## Running JavaPathFinder

Download the target files


For each program, answer the following questions:
1. How many paths were there?
2. How long did it take? Exact time not needed. Just state if it was minutes, seconds, hours, etc
3. How large is the input space? Give concrete numbers. In the worst case, how many testing runs would have to be executed to find this bug? 

### Submission
Submit your report which answers the questions for each target program to gradescope. 

In addition, answer the following question:
1. Discuss the pros and cons of symbolic execution vs testing. Use at least one example from the target files.
2. Discuss the pros and cons of symbolic execution vs formal verification. Use at least one example from the target files.

