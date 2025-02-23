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

In this part you will use EvoSuite to generate tests from the real world bug you studied in the last lab.

**Resources**
- [d4j gen_tests command](http://defects4j.org/html_doc/gen_tests.html)
- [d4j test command](http://defects4j.org/html_doc/d4j/d4j-test.html)
- [d4j coverage command](http://defects4j.org/html_doc/d4j/d4j-coverage.html)
- [d4j dissection](https://program-repair.org/defects4j-dissection/#!/)

First, refresh your memory of `Chart 1` by taking a look at the patch and trigger test. You should use the Defects4j Dissection site and your checked out version of `Chart 1` for reference.

Run the `gen_tests` command using the following parameters for evosuite:
`gen_tests.pl -g evosuite -p Chart -v <BUGNUM>b -n 1 -o lab5/ -b 60`  

As in the previous lab, the source files of the generated test suite are compressed into an archive with the following name: `project_id-version_id-generator.test_id.tar.bz2`. You can uncompress it by running `tar -xvjf <FILENAME>.`

**Evaluation**
Answer the same questions from Lab4:
1. How many tests did EvoSuite generate? 
2. Did any of the generated tests trigger the bug? A bug triggering test should fail on the buggy version and pass on the fixed version. 
    You can answer this by runing the `defects4j test` command:
    `defects4j test -w <PATH_TO_CHECKEDOUT_PROJECT> -s <PATH_TO_tar.bz2_FILE>`
3. What was the coverage of the generated test suite on the class under test? You can answer this by running `defects4j coverage` command:
`defects4j coverage -w <PATH_TO_CHECKEDOUT_PROJECT> -s <PATH_TO_tar.bz2_FILE>` Report both line and condition (branch) coverage.

## Submission 
Submit a document answering the following questions to Gradescope:

1. Part 1: Your fixed <FILES>  and the coverage plot.
3. Part 2: EvoSuite Results for your bug. Include the number of tests generated, if any trigger the bug, and the line and branch coverage.
4. Discuss differences between the EvoSuite generated tests and the developer written test.
5. Discuss differences between the EvoSuite and Randoop generated tests from Lab 4.

Remember to clearly indicate if you worked with a partner on this assignment.


