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

In this part, you will run EvoSuite to generate regression tests on a `BankAccount` class. 

**Setup**  
First, download the necessary files using:
`wget https://bmc-cs-software-analysis.github.io/383/labs/lab05/<FILENAME>` for the following files:
- `evosuite-383.jar`
- `BankAccount.java`
- `run.sh`

Open `BankAccount.java`  and inspect its behavior. This bank account starts locked and cannot perform and deposits or withdrawls until it is unlocked with an admin key. The admin key (1999) is encoded in hex and a decode method is used to convert it before comparing to the input pin.

The class contains two bugs. Inspect them and consider how you would trigger them by manually writing a test case. 

Once you've understood how you could trigger these bugs manually, let's run EvoSuite and study the quality of the generated test suite.

Run evosuite using the `run.sh` script I included. This should execute for 10 minutes and print a lot of output... If you're having problems running on goldengate for the entire duration, try running it locally.

When the script completes you should see something like this:

```
* Search finished after XXs and XXX generations, XXXX statements, best individual has fitness: XXX
* Minimizing test suite
* Going to analyze the coverage criteria
* Coverage analysis for criterion BRANCH
* Coverage of criterion BRANCH: X%
* Total number of goals: X
* Number of covered goals: X
* Generated X tests with total length X 
* Resulting test suite's coverage: X%
* Generating assertions
* Resulting test suite's mutation score: X%
* Writing tests to file
* Writing JUnit test case 'BankAccount_ESTest' to out/
* Done!

* Computation finished
```

The tests will be located in `out/BankAccount_ESTest.java`. Answer the following questions using the script's output and content in the generated test suite:

1. How many tests did EvoSuite generate?
2. What was the branch coverage of the generated test suite? If it was not 100%, what branches did it miss? Explain why it missed those branches.
3. Did EvoSuite find either of the bugs? If not, explain if this was an issue with the prefix, assertion, or both.

Now, we ran EvoSuite for quite a long time (10min). Let's inspect its incremental improvement over that time period by inspecting the logs in `evosuite-report/statistics.csv`. It includes the coverage for each time interval of 60 seconds. If you were to plot these values with an x axis from 0 to 10minutes and the y axis representing branch coverage, what would it look like? Submit this plot with your report. 

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

1. Part 1: Answer to the two questions and the coverage plot.
3. Part 2: EvoSuite Results for your bug. Include the number of tests generated, if any trigger the bug, and the line and branch coverage.
4. Discuss differences between the EvoSuite generated tests and the developer written test.
5. Discuss differences between the EvoSuite and Randoop generated tests from Lab 4.

Remember to clearly indicate if you worked with a partner on this assignment.

