# Data Structures and Algorithms (DSA) 

[![Build Status](https://travis-ci.org/YaroslavHavrylovych/dsa.svg?branch=development)](https://travis-ci.org/YaroslavHavrylovych/dsa)

*Read in [Українська](README-UK.md)*

This repo holds an overview and implementation of the most popular algorithms and data structures.
Each algorithm has at least Java implementation and additionally can have
Haskell or Kotlin.

The file you reading can give you only the overview, for more details about a particular
data structure or algorithms - please visit the corresponding sub-directory.

The repo is not at its final stage, and a lot is still not done. If you want to check
the progress, please visit the [trello](https://trello.com/b/TWRrtolV/dsa) board.

## Data Structures

[Data structure](https://en.wikipedia.org/wiki/Data_structure) -
 is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.

To understand this section, you have to know what is an 
[array](https://en.wikipedia.org/wiki/Array) and
[abstract data type](https://en.wikipedia.org/wiki/Abstract_data_type).

* List
* Set
* Associative array (Dictionary, Map)
* Heap
* Tree
   * Binary Tree
   * AVL Tree
   * Red-Black Tree
   * B-tree
   * Weigh-balanced Tree
* Trie
* Graph

## Algorithms

[Algorithm](https://en.wikipedia.org/wiki/Algorithm) -
is a description of a sequence of steps/actions one must perform to solve a particular problem.

Exists a vast amount of methods to group algorithms. My way is based on
[InterviewBit](https://www.interviewbit.com/courses/programming/)
and [hackerrank](https://www.hackerrank.com/dashboard):

* **[Sort](algorithms/sort/)**
  * [Bubble Sort](algorithms/sort/comparison/bubble/)
  * [Cocktail Shaker Sort](algorithms/sort/comparison/cocktail_shaker/)
  * Insertion Sort
  * Selection Sort
  * Comb Sort
  * Quick Sort
  * Merge Sort
  * Heap Sort
  * Count Sort
  * Radix Sort (Bucket, Digital)

## Preparing for an interview?

DSA is mostly recalled just before (or even at the time) an interview.
If you have to prepare ASAP, I would suggest solving a few problems from each section
on [InterviewBit](https://www.interviewbit.com/courses/programming/)
or [hackerrank](https://www.hackerrank.com/dashboard). 
This will warm you up, or give a fast overview of available methods of problems solving.
When you're done with that, you can continue there or switch to [leetcode](https://leetcode.com/), [e-olymp](https://www.e-olymp.com/uk/)
etc.

## Environment

* Java/javac - openJDK 11.0.1
* ghci (haskell runtime) - ghci version 8.2.2
* Kotlin/kotlinc - Kotlin version 1.3.21

## How to Run?

_Java_

build: `javac *.java`

run: `java filename`

_Kotlin_

build: `kotlinc *.kt -include-runtime -d output_file.jar`

run: `java -jar output_file.jar`

_Haskell_

build: `ghc -o output_file input_file.hs`

run: `./output_file`

**Bulk**

The *scripts* folder, from the root dir, contains:

`java_run.sh` - build and run for all Java files. 

`kotlin_run.sh` - build and run for all Kotlin files.

`haskell_run.sh` - build and run for all Haskell files.

`clean.sh` - clean the output directory.

Each script can have a single parameter which acts as a filter:

`java_run.sh bubble` - build and run all Java files, which have 
*bubble* in a path or a file name.
