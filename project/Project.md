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

Automated testing aims to generate tests which find bugs, prevent regressions and provide documentation. In this project, we will target bug finding as a use case for test generation. In other words, our goal will be to generate tests which find bugs. 

In general there are two types of bugs:
1. safety property violations
2. functional property violations

Tests consist of a prefix and an assertion. In order to find a bug, the prefix must set up state and exercise the buggy part of the code. Furthermore, the assertion must assert the correct behavior which the bug violates. 

In this project you will run state of the art automated testing tools to attempt to find bugs in a benchmark. You will record the current state of the art as a baseline and attempt to approve upon it. Test generation is an active and fruitful area of computer science research. This is your opportunity to contribute to it! 

Each group will be assigned a project from the Defects4J benchmark. Your goal will be to study the current state of test generation tools on finding that bug. You will closely analyze each bug and generated tests. 

## Objectives:

In this project, you will:

1. Run the testing tool and EvoSuite
2. Observe its outputs on the Defects4J benchmark and analyze strength and weaknesses
3. Run the assertion generator EditAs2
4. Improve upon the outputs on your target project

After completing steps 1-3, you will reflect on the effectiveness of these tools in real-world bug detection and consider how to optimize test generation processes for better results. Your findings will help in understanding the limitations and potential of automated bug-finding tools, setting the stage for further improvements in automated software testing.

## Important Dates:
1. Groups formed by Mar 17th at midnight
2. Part1 due Mar 31st - **Resubmission due April 13th at Midnight**
3. Part2 April 21st
5. Final Report due May 9th

# Part 1: Due March 31st - Resubmission due April 13th 

### Bug Assignments:

Each group will be assigned a project from Defects4j and range of bugs. 

### Part A: Inspection of each sample 

For each bug, inspect the bug and the developer written trigger test. Relevant instructions are included in Labs 4 and 5. You will need to checkout your bug using `defects4j checkout` and open it in an IDE of your choice. The [Defects4j dissection](https://program-repair.org/defects4j-dissection/#!/) site will be useful for this project. 

Record if the developer written test asserts on a functional or safety property. This will be included in Table 1 of your report. 

### Part B: Prefix Generation

For each bug, run EvoSuite with a search budget of 2 minutes to generate regression tests. The scripts and jar files from Lab 5 will be useful here.

Once the tests are generated, untar the archive file and inspect the generated tests. In particular, look at the tests which execute the buggy method. 


Experiments involving randomness should be repeated and averaged to account for the variability in outcomes caused by the randomness itself. Run each experiment for 3 trials with a search budget of 2 minutes each with a different random seed. To do this, you will need to set the `-b` and `-s` flags in [gen\_tests.pl](http://defects4j.org/html_doc/gen_tests.html)

For each bug, in how many trials was the buggy branch executed? Was it executed with a bug-triggering input? Record this in your report.

**Success Analysis**
Highlight the bugs for which we found success. Of the ones that did cover the bug, why? Was it a small search space?

**Error Analysis**
Of the ones that did not cover the bug, why not? What would it have taken to make it cover it? Was it in the test cluster? Large search space?

### Part C: Assertion Generation

For some bugs, EvoSuite will generate a prefix that executes the bug. In those cases, the assertion it generates will certainly not trigger the bug as it is a *regression oracle*. This means it reflects the current (buggy) implementation. 

To generate assertions, you will use the [EditAS2](https://arxiv.org/pdf/2309.10264) approach. This approach is a combination of the techniques you implemented in HW2. First, it uses an information retrieval approach based on Jaccard similarity of the prefix. It retrieves the assertion from the most similar prefix in the corpus. Then, it uses a neural model to perform an edit on that retrieved assertion. This approach requires access a GPU so you cannot run it directly. Instead, if you think your EvoSuite prefix executes the bug, ask the professor to generate the assertions for you. Perform an analysis on the assertions.

**Success Analysis**
Highlight the bugs for which we found success. Of the assertions that did trigger the bug, why? Was the retrieved assertion identical? Was there a small edit distance?

**Error Analysis**
Of the ones that did not cover the bug, why not? Was the edit distance very large?

### Part D: Report
Compile all of your results into a [latex document](https://www.overleaf.com/read/skgqsjtdprhz#2b546f) with your group. Make a copy of the linked document and modify it with your answers. Your report should include figures with each of your assigned bugs. 

# Part 2: Due April 21st

In this part, you will use your report to propose an improvement to either EvoSuite or the Assertion Generation. Your proposal should directly make use of your error analysis. 

In this part, you will add a section to your report which details your suggested improvement. Your goal should be to propose a unifying improvement which has the largest effect on your studied benchmark. In your report, list which bugs would be affected by this improvement and which results would be unchanged. Work through your proposed modification by hand (do not implement it for this part!) and show why this would be a good improvement. Make direct references to specific bugs and content in your error analysis. 

For this submission, please make all changes I suggested in the project part 2 check in.


# Part 3: Due May 9

In this part you will implement your proposed improvement and discuss results. The final report is due May 9th at midnight, but I highly recommend submitting early for feedback. Consider May 4th as the last submission day for high quality feedback. You're free to ask for feedback all the way up until the deadline, but I cannot guarantee a full read of your report with high quality comments unless it is submitted to me by May 4th at midnight.

After you implement and execute your improvement, perform the analysis in part 1 again. Only perform analysis on the component that you modified. If you targeted assertion generation, you do not need to re-run evosuite. If you targeted prefix generation, you do not need to re generate assertions. This part of the report should largely focus on the component which you are modifying. If your group is targeting prefix generation, you should still run 3 trials for each bug. 

Please include an error analysis or success analysis for each bug. Answer the same questions as in part 1. 

Your report must include a Table 3 which shows a comparison of your approach and original approach with a row for each bug. Include a results section which discusses your results in Table 3 both overall and for each bug. 

Make sure the answer the following questions at a minimum:
How effective was your improvement? Please also comment on the generality of your approach. Do you think it would be useful beyond the project benchmark you were given? Also include a cost-benefit discussion. Did your approach require additional memory or compute? If so, was it worth the benefits you saw? 

In your final submission, clearly state who was responsible for each bug.

### Making modifications to EvoSuite:

1. clone evosuite (`https://github.com/EvoSuite/evosuite`)
2. checkout the version you used for Part 1 (`git checkout dba720b`)
3. Make your changes
4. Create a new jar file using `mvn clean install -DskipTests`. 
5. The jar will be in: `shaded/target/evosuite-shaded-1.1.0.jar` run with `java JAR shaded.org.evosuite.EvoSuite`

For groups interested in biasing the generation of constants, here is an example I made to bias int generation toward 1999:
https://github.com/elizabethdinella/evosuite-debug/commit/280b75679316ec84cab4e945cdb79918bf1d994e

(Your modification should not simply bias toward hard coded constants, this is just a simple example)
