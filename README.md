# Log-processing-pre-lab

This is the pre-lab for the "Log processing" lab. It gives you some additional readings, along with practice with shell scripting, using Google Charts, and regular expressions.

## Table of Contents

* [Overview](#overview)
* [Readings](#pre-lab-readings-and-resources)
* [Exercises](#exercises)
* [To Turn In](#what-to-turn-in)

## Overview

The goal of this pre-lab is to help prepare us for the "Log processing lab". In particular we'll provide a set of potentially useful readings on particular topics that might be useful, and do three small exercises:

- [ ] Write a small "helper" shell script that will be useful when doing the lab itself.
- [ ] See how we can use that helper script to construct HTML/Javascript files that use the Google Charts tools to generate a nice graph.
- [ ] Experiment a little with regular expressions.

The *pre-lab* is an *individual* project, but the lab will be done in pairs. You should, again, clone your classroom repository and do your work in your copy. You should turn in the URL for your repository in whatever way the instructor requests.

## Pre-lab readings and resources

Read the **entire** lab in advance (<https://github.com/UMM-CSci-Systems/Log-processing>) and definitely ask questions,
especially conceptual ones.

Below is a list of some key tools we'll use a lot in this lab. Some were covered in readings associated with the previous lab; others have links to potentially useful material that you should at least skim before lab.

* `bash` command line arguments. These were covered in some of the readings for the previous lab; the top of [this bash tutorial](http://www.ibm.com/developerworks/linux/library/l-bash2/index.html) also covers command line arguments specifically.
* `bash` loops. If loops in `bash` feel like they're from another world, it's really because they are. They rather betray their age and the fact that they're kinda "hacked in" to a tool (`bash`) that wasn't really built with full-on programming in mind. [This tutorial](http://www.cyberciti.biz/faq/bash-for-loop/) and [that tutorial](http://tldp.org/LDP/abs/html/loops1.html) provide nice overviews and examples.
* `awk` is a very powerful Unix tool that can be used to automate loads of shell processes, but it takes some effort to learn. In many ways you'd probably rather use a modern scripting language like Ruby or Python, but `awk` is part of most any Unix installation, where you may not have Python or Ruby by default. You might find [this tutorial](http://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples/) or [that tutorial](http://www.grymoire.com/Unix/Awk.html) useful.
* `sed` (`s`tream `ed`itor) is another powerful, if old-school, standard Unix tools, that is particular useful doing "on-the-fly" editing of files or material coming through shell pipes. [this tutorial](http://www.grymoire.com/Unix/Sed.html) or [that tutorial](http://www.panix.com/~elflord/unix/sed.html) might help.
* `grep` was used in the previous lab, but here are some more `grep` resources in case that's useful: [this tutorial](http://www.panix.com/~elflord/unix/grep.html) and [that tutorial](http://www.ee.surrey.ac.uk/Teaching/Unix/unix2.html)
* [Google's charting tools](http://code.google.com/apis/chart/) support a broad range of sophisticated chart styles and types. In this lab we'll use Google's charting tools to visualize logging information from our lab.
* <http://linux.die.net/abs-guide/textproc.html> has a ton of info on the tools mentioned above along with others that will likely prove useful in the lab (e.g., `wc`, `head`, `sort`, etc.)

There's obviously tons of information on-line about all these tools, so feel free to search for other sources of info if these aren't working for you. You should do some background reading on these tools and try them out some before lab, though, so you don't spend all of the lab period Googling around for info on how to use these.

## Exercises

### Write `wrap_contents.sh`

In the full lab there are multiple occasions where we have some text that we want to wrap in a header and footer: The username distribution data is wrapped in its header and footer, the hours data is wrapped in its header and footer, the country distribution data is wrapped in its header and footer, and the combination of these texts is then wrapped in the overall header and footer. The script `wrap_contents.sh` is designed to automate this repeated process. It should take three arguments:

1. The name of the file containing the "contents" that need to be wrapped,
2. The name used to _specify_ the desired header and footer,
3. The name of the resulting file.

The second argument is a little odd because it's not an actual filename like the other two. It is instead the specifier for two filenames which are constructed by prepending the specifier to (a) `_header.html` and (b) `_footer.html`. So if the specifier is `frogs` then the header file will need to be `frogs_header.html` and the footer file will need to be `frogs_footer.html`. Only the specifier is provided as the second argument, and your script will need to construct those two file names from the provided specifier.

For example, this call:

```
./wrap_contents.sh gloop.txt bits target.html
```

will cause the contents of the file `gloop.txt` to be wrapped between the contents of `bits_header.html` and the contents of `bits_footer.html`, with the results being placed in `target.html`. This assumes that `gloop.txt`, `bits_header.html`, and `bits_footer.html` all exist (you _don't_ need to make them).  The script should overwrite `target.html` if there was a file with that name.

The actual joining of the files can be easily accomplished with `cat`. This should be a short little script; if you spend more than 15-20 minutes on it I would definitely start asking some questions. The trickiest part is probably forming the correct file names from the arguments you're given; curly braces might be useful there.

There is a simple set of tests in `wrap_tests.bats` that give you a sense of whether your implementation of `wrap_contents.sh` works.

### Make a sample pie chart using `wrap_contents.sh`

To give you an idea of what `wrap_contents.sh` will be used for in the lab, there are three files in the the `chart_example` directory in this repository:

* `meats.txt`
* `bread_header.html`
* `bread_footer.html`.

If you wrote your `wrap_contents.sh` script correctly, this call

```
../wrap_contents.sh meats.txt bread my_chart.html
```

should produce an HTML file called `my_chart.html` that, when loaded in your favorite browser, displays a pie chart indicating preferences for different sandwich meats. Generate that HTML file (`my_chart.html`) and commit it as part of your repository.

The file `chart_example/sample_chart.html` is an example of the kind of thing you're looking to create, so you should be able to compare your work to that; `wrap_tests.bats` will do that automatically but you should probably check it yourself as well.

### Practice with regular expressions

_Regular expressions_ (or "regex" for short)
are an extremely important tool in
all software development, and they come up a _lot_ in systems
work and scripting. Like so many things, learning the most
commonly used 10% is 90% of the battle; not that many people
can use the more esoteric features without looking things up.

There are a _bunch_ of on-line resources to help you learn
to use regular expressions. A few that you might look
at include:

- https://regexone.com – a very nice, structured tutorial
  that takes you from the basics up through advanced usages
  in a nicely paced way.
- http://play.inginf.units.it – a structured game that
  also takes you from the basics up through advanced usage,
  although it gets tricky fairly quickly. You have to
  "pseudo-register", but
  you can in fact just make stuff up if you want to.
- https://regexcrossword.com – fun if you like your learning
  in a more puzzle-oriented form. They provide a set of
  "crosswords" where the clues are regular expressions, and
  you have to figure out what letter fits in a box and
  satisfies the regexes for that cells row and column. Gets
  tricky pretty fast.

As well as _learning_ tools like those above, there are also
some neat tools that allow you to just check that your
regexes are doing what you want. These are sometimes language
specific (more below), so be aware of what assumptions the
tool makes. Two widely used ones are
[regexr](http://regexr.com/) and
[Rubular](http://rubular.com/).

One nasty truth in the world, though, is that different
programming languages and shell tools (like `grep`) implement
different versions of regular expressions. Worse, often the
same tool (again, like `grep`) can handle different types of
regular expressions depending on what flags you give it.
`grep` in the lab, for example, currently supports at least
three different flavors of regex: `--basic-regexp`,
`--extended-regexp`, and `--perl-regexp`.

One place where this shows up in quite annoying ways is that
different regex implementations support different
"abbreviations" for common character classes. Pretty much
any regex system will let you use `[0-9]` to match any digit
from 0 to 9. Many (most?) will also let you use `\d` (where
'd' is for _digit_). But some require that you use the more
verbose (but perhaps more readable?) `[[:digit:]]`.

Similarly, another common character class is _words_, which
is in fact typically interpreted to be upper and lower case
letters _plus_ digits and underscore. (So it's actually
characters that can appear in variable names in most
imperative programming languages.) You could just write that
out as a character class, `[a-zA-Z0-9_]`, but many systems
also support the `\w` abbreviation that means the same thing.
The POSIX scheme gives us `[[:alpha:]]`, which is `[a-zA-Z]`
and `[[:alnum:]]`, which is `[a-zA-Z0-9]`, but nothing that
is exactly what `\w` since `alnum` doesn't include the
underscore.

Sigh – history is complicated.

#### Regex examples

To illustrate these differences, imagine we have an input
file `r0_input.txt` that contains

```
* KK, muffins
* Nic, donuts
* Vincent, juice
```

and we want to match and print out the name and
breakfast snack in the form:

```
1. KK
2. muffins

1. Nic
2. donuts

1. Vincent
2. juice
```

Here are several solutions, some using `sed` and some using `awk`. The `sed` solutions both require the `-E` flag, or
you don't get the group matching (the `\1` in the "output"
part of the match). You can use `[[:alpha:]]` in `sed`, but
you can't use `\w`.

```bash
sed -E 's/\* ([a-zA-Z]+), ([a-zA-Z]+)/1. \1\n2. \2\n/' < r0_input.txt
```

```bash
sed -E 's/\* ([[:alpha:]]+), ([[:alpha:]]+)/1. \1\n2. \2\n/' < r0_input.txt
```

`awk` doesn't directly support group matching in its
regular expression clause, but we can use the `match` function
to capture matches and put them in an array so we can access
them later. `awk` (actually `gawk`, which is what `awk`
defaults to in our lab) does allow `\w`, as well as `:alpha:`.

```bash
awk 'match($0, /([a-zA-Z]+), ([a-zA-Z]+)/, groups) {print "1. " groups[1] "\n" "2. " groups[2] "\n" }' < r0_input.txt
```

```bash
awk 'match($0, /(\w+), (\w+)/, groups) {print "1. " groups[1] "\n" "2. " groups[2] "\n" }' < r0_input.txt
```

```bash
awk 'match($0, /([[:alpha:]]+), ([[:alpha:]]+)/, groups) {print "1. " groups[1] "\n" "2. " groups[2] "\n" }' < r0_input.txt
```

#### Regex Exercises

In the `regex` folder there are three input files:

* `r0_input.txt`
* `r1_input.txt`
* `r2_intput.txt`

You should write a script `regex.sh` (in the folder `regex`)
that uses a tool like
`sed` or `awk` and regular expressions to extract the desired
content and output it as displayed below. In each case the
output should go in a file with the name `r0_output.txt`,
`r1_output.txt`, and `r2_output.txt`, respectively.
(And yes, we basically did one for you.)

#### Regex 0

**Input:**

```
* KK, muffins
* Nic, donuts
* Vincent, juice
```

**Output:**

```
1. KK
2. muffins

1. Nic
2. donuts

1. Vincent
2. juice
```

#### Regex 1

**Input:**

```
* I am KK. My favorite sandwich is turkey.
* I am Nic. My favorite sandwich is avacado.
* I am awesome. I love puppies, but I don't like sandwiches.
* I am Vincent. My favorite sandwich is ham.
```

**Output:**

```
1. KK
2. turkey

1. Nic
2. avacado

1. Vincent
2. ham
```

#### Regex 2

**Input:**

```
* sandwich with turkey.bacon.swiss. for here
* sandwich with ham.cheddar. to go
* sandwich with tunaSalad. to go
```

**Output:**

```
1. turkey.bacon.swiss.
1. for here

1. ham.cheddar.
1. to go

1. tunaSalad.
1. to go
```

## What to turn in

Be sure to complete the following before the start of lab:

* Accept (individually) the github classroom assignment
* Do the Exercises (adding and commiting as you go)
   - [ ] Complete `wrap_contents.sh` (Exercise 1)
   - [ ] Produce `my_chart.html` with the pie chart (Exercise 2)
   - [ ] Implement `regex.sh` (Exercise 3)
* Make sure you push your changes up to Gitub.
* Submit your URL to canvas when you are ready to be graded.
