# snakemake-tutorial

This provides a hopefully simpler introduction to snakemake than the official doccumentation, but you'll eventually want to read the documentation.

## Contents

## The quest for reproducibility

We want code that is reproducible. But what actually makes code reproducible? Some qualities of reproduciblity include:

* readability: code can be easily understood by humans

* portability: code still works even when transferred between computers with different environments

* modularity: I can swap functional chunks of code between scripts

* transparency: the exact values of every parameter are clearly specified

* scalability: code still works even if the size of the input data changes

In addition, I also like to add:

* parallelizability: data can be processed over an arbitrary number of cores

* accessibility: data can be accessed at little cost to the user in terms of money and time

Can you think of other qualities reproducibile works have?

How can we achieve all of these awesome things? To start, we need an abstract generalized framework for how to think about data analysis.
 
## Workflows

**Workflows** are a series of functions (i.e. rules) each with defined inputs, outputs, and parameters.

Workflows have two more defining qualities: 

* directionality: information flows between functions in one direction

* acyclic-ity: the same piece of data cannot be both the input and the output for the same function. In other words, each function must perform some modification or transformation to the data - otherwise, there's no reason to apply the function in the first place. 

These terms probably give you a hint that workflows can be visualized as a graph, where the nodes are rules and the edges define how the outputs of one rule serve as the input to the next rule and so on.

We also want to think in terms of backwards design. In other words, define what the final outcome is that you want, then figure out the steps you need to do in order to get that final outcome. We build workflows by specifying the exact output that we want. From there, the necessary input are inferred.

It is also possible for a rule to have an input and no output, or an output but no input.

## What is snakemake?

So with our general framework in mind, how can we write a reproducible analysis as a workflow?

[Snakemake](https://snakemake.github.io/) **is a python-based software for building and running workflows.**

## Finally, a snakemake tutorial

So you've decided that you want to use snakemake for your next project. Great! But how do you actually use it?

###  Create project directory

This repo is structured as an example. Start by cloning/downloading this repo to your local computer. 

If you want to make your own, it should look something like this:

```
project_directory/
- config/
- workflow/
 - Snakefile
 - rules/
 - envs/
 - scripts/
- results/
 - yyyy-mm-dd/
- src/
- doc/
- README.md
- LICENSE.md
```

Below is a description of what each directory is generally used for.

* `doc/` contains general notes that you may add to as your read papers, get ideas, etc.

* `src/` contains code you need to create the structured dataset that you then input into snakemake 

Ideally, this directory should be hosted on github so that all changes are tracked and backed-up.

### The components of a rule - fundamentals

Once you download this repo, open it and you should see this:

```
rule my_rule:
	input: "input.txt"
	output: "output.txt"
	shell: "cp {input} > {output}"
```

To apply this rule, we run:

`snakemake --cores 1 output.txt`

What's happening here? Snakemake sees the final file you want, "output.txt", then figures out the rules that need to be run in order to produce that file. In this case, it just needs to apply `my_rule` one time.

### The components of a rule - advanced

```
rule my_rule:
	input:
	output:
	params:
	conda:
	envmodules:
	container:
	log:
	threads:
	resources:
	priority:
	shell:
```

### Questions you may be asking now

How can I use snakemake on the HPCC?

## Final thoughts

Some key lessons I've learned are:

* **Do not** blindly trust workflows that people post on the internet, no matter how prestigous the author is. No matter how general a workflow was intended to be, it was written with many assumptions in mind. Many workflows assume that you're working with human/medical data, for example. Use the workflows of other people as inspiration for writing your own, or at least think critically and thoroughly test a workflow before using it.

* Always output more information than you need

## Helpful links

### Tips and best practices

[Best practices](https://snakemake.readthedocs.io/en/stable/snakefiles/best_practices.html)

[Distribution and reproducibility](https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html)

### Official tutorials

These official snakemake tutorials are rather complicated, including the ones labeled as "basic". However, they are quite practical.

["Basic" tutorial](https://snakemake.readthedocs.io/en/stable/tutorial/short.html)
