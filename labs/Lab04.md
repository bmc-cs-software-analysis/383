---
layout: default
title: "Defects4J"
type: Lab
number: 04
active_tab: lab
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



{{page.type}} {{page.number}}: {{page.title}}
=============================================================

This lab is optionally a partner assignment. Make sure your document specifies if you worked with a partner.

## Objectives:

In this lab, you will explore randomized test generation using Randoop and evaluate the resulting test suites across several dimensions. You will consider the strengths and weaknesses by running it on a real-world bug using the Defects4j benchmark.

1. Run the randomized testing tool Randoop 
2. Observe its outputs on the Defects4J benchmark

## Part 0: Background

First follow this [Randoop tutorial](https://elizabethdinella.github.io/blog-posts/randoop/) to run Randoop on a small example. 

In this lab you'll be running Randoop on a real world bug from the Defects4j benchmark. Read the Abstract, Introduction, and Section 3 of the [Defects4j publication](https://homes.cs.washington.edu/~mernst/pubs/bug-database-issta2014.pdf). Since the paper was published in 2014, the authors have extended the benchmark to 854 bugs from additional projects.

## Setup
1. [Defects4J](https://github.com/rjust/defects4j) - Defects4j should already be installed in goldengate. If you would like to run this locally, follow the installation instructions in the README. 

In this lab you will study bugs in the [Chart](https://www.jfree.org/jfreechart/) project. The Chart project is a Java chart library for programatically creating professional quality charts. Explore [this page](https://www.jfree.org/jfreechart/samples.html) for some examples.

## Part 1: Checking out your bug

For this lab you will be working with **Chart 1**.

**Resources**
- [d4j checkout documentation](http://defects4j.org/html_doc/d4j/d4j-checkout.html)
- [d4j info documentation](http://defects4j.org/html_doc/d4j/d4j-info.html)
- [d4j dissection](https://program-repair.org/defects4j-dissection/#!/)

As a first step, checkout your bug and open the project in an IDE of your choice. Defects4J abstracts the process of checking out a buggy version of the benchmark project with the `defects4j checkout` command. 

Run `defects4j checkout -p Chart -v <BUGNUM>b -w <OUTPUT_DIR>` to checkout your bug. A documentation page with more information on the parameters is linked in the resources.

### Inspecting the Developer Written Test

After a bug is found and fixed, developers usually write a test case to ensure that the bug does not reoccur. In this subpart, you will analyze a developer-written test case that was introduced after the bug was fixed. 

Each bug in Defects4j includes a test case added by the developer who fixed the issue. This test case serves to verify the bug was addressed. An ideal automated test generation tool (such as Randoop) would have found this bug before it was introduced, thus preventing it.

1. **Find the Developer Written Test**
Run the following command to gather information about the bug:
`defects4j info -p Chart -b <BUG NUM>`
The output will include details about the "triggering" test. Go to the developer-written test case and open it for inspection. You can also refer to the Defects4j Dissection website to locate this test. 


2. **Read and Analyze the Test**
    Carefully read the test case the developer wrote for the bug fix. Try to understand what the bug was and how the test ensures the bug is fixed. Describe the bug in a few sentences. Include whether the triggering test expose a safety or functional property violation?

By understanding the developer's test, you will get insight into what an ideal automated test generation tool should catch. This analysis will serve as a basis for evaluating the automated tests you will generate in the next steps.

## Part 2: Generating Randoop Tests
In this part you will use Randoop to generate tests for each class containing a bug. As you know from previous assignments, it can be tricky to get the java class path right to compile and execute tests. Defects4j provides scripts to abstract the process of directly calling the test generation tools. 

**Resources**
- [d4j gen_tests command](http://defects4j.org/html_doc/gen_tests.html)
- [d4j test command](http://defects4j.org/html_doc/d4j/d4j-test.html)
- [d4j coverage command](http://defects4j.org/html_doc/d4j/d4j-coverage.html)
- [Randoop documentation](https://randoop.github.io/randoop/)

Generate tests using the following command:  
`gen_tests.pl -g randoop -p Chart -v <BUGNUM>b -n 1 -o lab4/ -b 60 -E`
Replace "\<BUGNUM\>" with the bug number you are targetting. 
You can replace `lab4/` with wherever you would like the generated tests to be output. Be sure to run with `-E` to generate error revealing (instead of regression) tests. This will run for one minute (-b 60).

The source files of the generated test suite are compressed into an archive with the following name: `project_id-version_id-generator.test_id.tar.bz2`.  You can uncompress it by running `tar -xvjf <FILENAME>`.

Open the tests in a test editor of your choice. Are you surprised by what you see? Consider how these tests compare to the manually written test you inspected in the previous step. 

**Evaluation**
1. How many tests did Randoop generate? 
2. Did any of the generated tests trigger the bug? A bug triggering test should fail on the buggy version and pass on the fixed version. 
    You can answer this by runing the `defects4j test` command:
    `defects4j test -w <PATH_TO_CHECKEDOUT_PROJECT> -s <PATH_TO_tar.bz2_FILE>`
    Do this on both the buggy and fixed versions. Note that the results execute the tests twice (you'll see a number much larger than the total number of tests generated) so you should divide the number of failed tests by two. You'll need to checkout the fixed version as well. Were you surprised by the results? Think of what kinds of bugs randoop is capable of finding using its set of contracts.

3. What was the coverage of the generated test suite on the class under test? You can answer this by running `defects4j coverage` command:
`defects4j coverage -w <PATH_TO_CHECKEDOUT_PROJECT> -s <PATH_TO_tar.bz2_FILE>` Report both line and condition (branch) coverage.

## Submission
Submit a document answering the following questions to Gradescope:
1. Part 1: Description of your bug. Does the trigger test expose a safety or functional property violation?
2. Part 2: Randoop Results for your bug. Include the number of tests generated, if any trigger the bug, and the line and branch coverage.
3. Discuss differences between the Randoop generated tests and the developer written test. 

Remember to clearly indicate if you worked with a partner on this assignment. 
