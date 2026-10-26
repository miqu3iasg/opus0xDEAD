# ALG4 — Algorithms

## Overview

**Author:** Robert Sedgewick; Kevin Wayne  
**Edition:** 4th  
**Subject:** Algorithms and Data Structures

_Algorithms_ presents a systematic study of fundamental algorithms and data structures, emphasizing implementation, mathematical analysis, and empirical evaluation of performance. The book covers foundational programming techniques, abstract data types, algorithm analysis, sorting, searching, graph processing, and string processing, followed by selected advanced topics. Its implementations use Java and an approach based on modular design and data abstraction.

The book adopts a scientific approach to algorithm development: formulate a problem, develop an algorithm, implement it, analyze its performance, and validate its behavior experimentally. It provides both theoretical foundations and practical implementations, making it suitable for developing a deeper understanding of algorithms and their applications.

## Bibliographic Reference

SEDGEWICK, Robert; WAYNE, Kevin. _Algorithms_. 4. ed. Upper Saddle River, NJ: Addison-Wesley, 2011. 976 p. ISBN 978-0-321-57351-3.

## Learning Objectives

By completing this book, I should be able to:

- Analyze the time and space complexity of algorithms using mathematical models, asymptotic notation, and empirical experiments.
- Implement and evaluate fundamental data structures, including stacks, queues, linked lists, symbol tables, search trees, heaps, and hash tables.
- Understand, implement, and compare fundamental sorting and searching algorithms, explaining their correctness, performance, and trade-offs.
- Represent and process graphs using fundamental traversal algorithms, minimum spanning tree algorithms, and shortest-path algorithms.
- Implement string-processing algorithms, including radix sorting, tries, substring search, regular expressions, and data compression techniques.
- Apply algorithmic problem-solving techniques to practical computational problems and select appropriate algorithms and data structures based on their requirements.
- Understand selected advanced topics, including event-driven simulation, B-trees, suffix arrays, network flow, reductions, and computational intractability.

## Progress

Each chapter is listed with its sections. A checked item indicates that the corresponding material has been completed.

- [/] **Chapter 1 — Fundamentals** (`C01-fundamentals`)
  - [x] 1.1 Basic Programming Model
  - [ ] 1.2 Data Abstraction
  - [ ] 1.3 Bags, Queues, and Stacks
  - [ ] 1.4 Analysis of Algorithms
  - [ ] 1.5 Case Study: Union-Find
- [ ] **Chapter 2 — Sorting** (`C02-sorting`)
  - [ ] 2.1 Elementary Sorts
  - [ ] 2.2 Mergesort
  - [ ] 2.3 Quicksort
  - [ ] 2.4 Priority Queues
  - [ ] 2.5 Applications
- [ ] **Chapter 3 — Searching** (`C03-searching`)
  - [ ] 3.1 Symbol Tables
  - [ ] 3.2 Binary Search Trees
  - [ ] 3.3 Balanced Search Trees
  - [ ] 3.4 Hash Tables
  - [ ] 3.5 Applications
- [ ] **Chapter 4 — Graphs** (`C04-graphs`)
  - [ ] 4.1 Undirected Graphs
  - [ ] 4.2 Directed Graphs
  - [ ] 4.3 Minimum Spanning Trees
  - [ ] 4.4 Shortest Paths
- [ ] **Chapter 5 — Strings** (`C05-strings`)
  - [ ] 5.1 String Sorts
  - [ ] 5.2 Tries
  - [ ] 5.3 Substring Search
  - [ ] 5.4 Regular Expressions
  - [ ] 5.5 Data Compression
- [ ] **Chapter 6 — Context** (`C06-context`)
  - [ ] Event-driven simulation, B-trees, suffix arrays, network flow, reductions, and intractability

## Naming Convention

This book follows the repository's general naming convention, with the adaptations that Java requires. The chapter directories are:

```text
ALG4/
├── meta.md
├── resources/
├── templates/
├── C01-introduction/
│   ├── notes/
│   │   └── out/
│   └── exercises/
│       └── out/
├── C02-.../
```

Java requires the name of a public class to match the name of its file, and class names cannot contain dashes or dots. Java files therefore use underscores instead of them, and the description is written in camel case, which is also the class name:

```text
SX_X_X_TXXX_Description.java
```

Examples:

```text
exercises/S1_1_X024_EuclidsAlgorithm.java
exercises/S1_3_X001_FixedCapacityStack.java
notes/S1_4_P001_ThreeSum.java
notes/S2_1_P001_Selection.java
```

Notes written in Markdown keep the general format (for example, `notes/S1.1-N001-basics.md`).

The compiled `.class` files go to an `out/` directory inside the same `notes/` or `exercises/` directory as the source files, never next to them. A source in `exercises/` is compiled to `exercises/out/`, and a source in `notes/` to `notes/out/`. For example, from `C01-fundamentals/exercises/`:

```text
javac -d out S1_1_X024_EuclidsAlgorithm.java
java -cp out S1_1_X024_EuclidsAlgorithm
```

The `out/` directories are build artifacts and are not versioned.

## Notes

This book is intended for readers with basic programming skills and familiarity with fundamental programming constructs. Previous exposure to data structures is helpful but not strictly necessary, since the book develops many of the relevant concepts from first principles.

Java is the primary programming language used throughout the book. Implementations and exercises should be treated as opportunities to understand algorithmic behavior, data representation, and performance rather than merely as programming tasks.

The study should emphasize understanding the underlying ideas, implementing algorithms independently, reasoning about correctness, and comparing theoretical complexity with observed performance. Mathematical concepts should be studied alongside their algorithmic applications, particularly asymptotic analysis, recursion, elementary probability where relevant, and graph theory.

The book's official companion website provides Java implementations, exercises, test data, lecture slides, visualizations, and additional learning resources.

## Links

- Official companion website — https://algs4.cs.princeton.edu/home/
- Official book page and resources — https://sedgewick.io/books/algorithms/
- Publisher's book page — https://www.pearson.com/en-us/subject-catalog/p/algorithms/P200000000597/9780132762564
- Complete table of contents — https://www.oreilly.com/library/view/algorithms-4th-edition/9780132762564/toc.html
- Java implementations and reference code — https://github.com/kevin-wayne/algs4
