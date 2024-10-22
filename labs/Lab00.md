---
layout: default
title: "What Makes a Good Test Suite?"
type: Lab
number: 00
active_tab: lab
release_date: 2024-01-22

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

## Objectives:

In this lab, you will:

1. Review JUnit and how to use it effectively.
2. Consider what makes a good test suite and how to strengthen it. 

In this course we will explore various techniques for chekcing software correctness. As we saw in class, each method comes with its own tradeoffs, balancing cost, and the level of confidence they provide.

In today's lab we will focus on one of the simplest and most flexible methods: ad-hoc testing. 

Ad-hoc testing is an informal testing approach where testers explore the application on the fly by writing test cases non systematically. The main goal is to find defects quickly by relying on intuition, experience, and understanding of the system. In this lab, you'll write unit tests for code to parse integers and dates. As you work, reflect on what factors makes a test suite effective.

## JUnit Review and Setup

JUnit is a unit testing framework for Java, designed to facilitate the creation and execution of tests for individual "units" of code, typically methods. JUnit provides libraries for writing tests and assertions and a framework for executing those tests and confirming their results.

Download the junit and hamcrest jars:

### Setup Instructions

To get started, download the following jar files:

1. junit-4.13.2.jar:
`wget https://repo1.maven.org/maven2/junit/junit/4.13.2/junit-4.13.2.jar`
2. hamcrest-core-1.13.jar: 
`wget https://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar`

To run junit, first compile the test file, then run your suite using the following two commands:

```bash
javac -cp .:junit-4.13.2.jar  TestFile.java
java -cp "./junit-4.13.2.jar:./hamcrest-core-1.3.jar:./" org.junit.runner.JUnitCore TestFile
```

Alternatively, you can use the `run_junit.sh` script I created which simplifies this process. You can find it here: https://github.com/BMC-CS-151/class-examples-s24/blob/main/lec07/Stacks/run_junit.sh

The script takes the test filename (without the .java extension) as a command line argument:

```bash
bash run_junit.sh TestFile
```

Ensure your jar files are in the current working directory, or modify the classpath accordingly.

## 1. Testing ParseInt

To begin, download the following files:
- Source file: <lab0/StringToInteger.java>
- Starter test file: <lab0/TestStringToInteger.java>

Take note of the imports and the `@Test` annotation in the starter test file. 

The `assertEquals` method is used to compare the expected value with the actual value produced by your code.

JUnit offers a variety of assertion types for different testing needs. For more details, you can read the documentation here: https://junit.org/junit4/javadoc/4.13/org/junit/Assert.html

### Your Task: 

Your goal is to add tests for the parseInt method. As you write your tests, consider the following questions:

1. How do you determine when you have tested enough cases?
2. What criteria did you use to select your input values?
3. How did you derive your assertions, and how did you establish what the expected values should be?

Once you feel confident that your tests are comprehensive, proceed to the next section.

## 2. Parsing Dates 

In this part of the lab, you will implement a program to parse date strings formatted as "YYYY-MM-DD" into Date objects. You will also create a corresponding test suite to validate your implementation.

### Your Task:

1. Implement a `parseDate` method which takes a string and returns a corresponding `Date` Object. As you work on this task, think critically about what constitutes legal and illegal inputs. Not every Java string can be parsed as a date; for example, consider the string "hello world". Reflect on edge cases and invalid formats, and ensure your implementation can handle a variety of scenarios appropriately.

2. Write a JUnit test suite to ensure your implementation functions correctly. 

As you proceed, reflect again on our question: What makes a good test suite? 

How does this section differ from the previous one regarding testing? Does implementing the code alongside writing the tests change your perspective on how you approach testing?

### Signing out
Submit both of your test suites and `ParseDate` implementation to gradescope along with a document of your current thoughts. For this lab, there are no wrong answers! Just give your intuition. Next week, we will learn about established test quality metrics.

1. Test Suite Quality: 
a. What qualities make a good test suite? 
b. How could you potentially automatically measure these qualities? Would it be possible?
c. If you were to change your test suite to be as poor as possible on these metrics, how would it get worse?
d. How did you know when to stop testing? 

2. Writing Test Suites: 
a. What was the most difficult part of writing your test suite? 
b. Was it easier to write tests for the code you are familar with and wrote yourself?
c. For Part 2, did you write tests first or the implentation? How was your experience? How would things have changed if you did it the other way around?
d. How did I derive assertions? Was it different for each part? How did you understand what the expected value should be?

3. AI Written tests: For this section ask ChatGPT (or your favorite AI assistant) to write tests for both source files. 
a. Include a few sentences on the quality of these tests. Do they compile? What makes them good / bad? What properties do they satisfy or vioalte? Include examples.
