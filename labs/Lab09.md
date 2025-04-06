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
I recommend running on atria. Be sure to backup your lab report elsewhere.

1. You will need java version 8 for this lab. Install sdkman using the instructions in Lab 5 Part 0. 
    Once it is installed run:
    `sdk install java 8.0.442-librca` and `sdk use java 8.0.442-librca`

2. Download the following 2 zip files and unzip them:
    `wget https://github.com/bmc-cs-software-analysis/383/blob/main/labs/lab09/jpf-core.zip` and
    navigate to this link: `https://drive.google.com/file/d/1DCv9KtwMi8bKKjeyNFpDQDq5d-QRp3DT/view?usp=sharing`    

3. Create a `.jpf` directory in your home directory and create a `site.properties` file:
    `mkdir ~/.jpf`
    `cd ~/.jpdf`
    `vim site.properties` and add the following lines:

    ```bash
    jpf-core=PATH-TO-UNZIPPED-DIR/jpf-core
    jpf-symbc=PATH-TO-UNZIPPED-DIR/jpf-symbc
    extensions+=,jpf-symbc
    ```

4. Download the target files:
    `wget https://github.com/bmc-cs-software-analysis/383/blob/main/labs/lab09/lab9-targets.zip` 

    

## Running JavaPathFinder

For each target file, compile the target with `-g`. 

Then, run the jpf-core jar on the `.jpf` file:
`java -jar jpf-core/build/RunJPF.jar Target.jpf`

You should see output with the following:
```
### PCs: total:4 sat:4 unsat:0

string analysis: SPC # = 0
NPC constraint # = 2
x_1_SYMINT == CONST_0 &&
x_1_SYMINT >= y_2_SYMINT

====================================================== error 1
gov.nasa.jpf.vm.NoUncaughtExceptionsProperty
java.lang.ArithmeticException: div by 0
	at Target.test(Target.java:7)
	at Target.main(Target.java:13)
```

This means there were 4 total path conditions that were all satisfiable.

The shown path constraint
```
### PCs: total:4 sat:4 unsat:0

string analysis: SPC # = 0
NPC constraint # = 2
x_1_SYMINT == CONST_0 &&
x_1_SYMINT >= y_2_SYMINT

====================================================== error 1
gov.nasa.jpf.vm.NoUncaughtExceptionsProperty
java.lang.ArithmeticException: div by 0
	at Target.test(Target.java:7)
	at Target.main(Target.java:13)
```

For each program, answer the following questions:
1. How many paths were there? Were all satisfiable? 
2. Did the SymExc tool find the bug? If not why? 
3. How long did it take? Exact time should be listed in the tool's output. 
4. How large is the input space? Give concrete numbers. In the worst case, how many testing runs would have to be executed to find this bug? 

### Submission
Submit your report which answers the questions for each target program to gradescope. 

In addition, answer the following question:
1. Discuss the pros and cons of symbolic execution vs testing. Use at least one example from the target files.
2. Discuss the pros and cons of symbolic execution vs formal verification. Use at least one example from the target files.
3. Some targets in this lab did not have assertions, but the tool could still find bugs. Why? What does java path finder use for postconditions?
4. Compare the outputs on Target 5 and Target 6. Was there a difference? why/why not? Your answer should include a discussion involving `input.txt`

