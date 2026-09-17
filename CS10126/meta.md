# CS10126 — Structure and Interpretation of Computer Programs

## Overview

**Authors:** Harold Abelson, Gerald Jay Sussman, Julie Sussman
**Edition:** 2nd Edition
**Subject:** Computer Science, Programming Languages, Abstraction, and Computational Thinking

_Structure and Interpretation of Computer Programs_ develops fundamental ideas of programming through the Scheme programming language. Rather than focusing primarily on syntax or a particular programming paradigm, the book explores how programs are constructed, interpreted, evaluated, and organized through increasingly powerful abstractions.

The book develops concepts including procedural abstraction, higher-order functions, data abstraction, mutable state, metalinguistic abstraction, interpreters, register machines, and the relationship between programming languages and the processes they describe.

## Learning Objectives

By completing this book, I should be able to:

- Understand programs as descriptions of computational processes.
- Use procedural abstraction to manage complexity.
- Understand the substitution and environment models of evaluation.
- Work effectively with higher-order procedures.
- Use recursion and iteration to express computational processes.
- Construct abstractions over compound data.
- Separate data representation from data usage through abstraction barriers.
- Understand symbolic data and generic operations.
- Model mutable state and stateful computational objects.
- Understand the consequences of assignment and shared state.
- Organize systems using data-directed programming.
- Understand generic operations and type systems.
- Design and implement interpreters for programming languages.
- Understand evaluation as an interpretable computational process.
- Use metalinguistic abstraction to construct new languages.
- Understand the relationship between interpreters and programming-language semantics.
- Analyze programs in terms of computational processes rather than only their final results.
- Understand register machines and the implementation of evaluators.
- Reason about compilation and the implementation of higher-level abstractions.

## Reading Progress

### Chapter 1 — Building Abstractions with Procedures

- [ ] 1.1 — The Elements of Programming
- [ ] 1.2 — Procedures and the Processes They Generate
- [ ] 1.3 — Formulating Abstractions with Higher-Order Procedures

### Chapter 2 — Building Abstractions with Data

- [ ] 2.1 — Introduction to Data Abstraction
- [ ] 2.2 — Hierarchical Data and the Closure Property
- [ ] 2.3 — Symbolic Data
- [ ] 2.4 — Multiple Representations for Abstract Data
- [ ] 2.5 — Systems with Generic Operations

### Chapter 3 — Modularity, Objects, and State

- [ ] 3.1 — Assignment and Local State
- [ ] 3.2 — The Environment Model of Evaluation
- [ ] 3.3 — Modeling with Mutable Data
- [ ] 3.4 — Concurrency: Time Is of the Essence
- [ ] 3.5 — Streams

### Chapter 4 — Metalinguistic Abstraction

- [ ] 4.1 — The Metacircular Evaluator
- [ ] 4.2 — Variations on a Scheme — Lazy Evaluation
- [ ] 4.3 — Variations on a Scheme — Nondeterministic Computing
- [ ] 4.4 — Logic Programming

### Chapter 5 — Computing with Register Machines

- [ ] 5.1 — Designing Register Machines
- [ ] 5.2 — A Register-Machine Simulator
- [ ] 5.3 — Storage Allocation and Garbage Collection
- [ ] 5.4 — The Explicit-Control Evaluator
- [ ] 5.5 — Compilation

## Organization

Each book has its own directory, so the book code `CS10126` does not need to be repeated in the filenames.

The material is organized by chapter, with separate directories for notes, code, and exercises.

```text
CS10126/
├── meta.md
├── resources/
│   └── sicp.pdf
├── C01-building-abstractions-with-procedures/
│   ├── notes/
│   ├── code/
│   └── exercises/
├── C02-building-abstractions-with-data/
│   ├── notes/
│   ├── code/
│   └── exercises/
└── ...
```

### File Naming Convention

The general format is:

```
CXX-SX.X.X-TXXX-description.ext
```

Where:

- `CXX`: Chapter identifier.
- `SX.X.X`: Section identifier based on the original book.
- `TXXX`: Content type and sequential number.
- `description`: Short, descriptive name.
- `ext`: File extension.

### Content Types

- `NXXX`: Note.
- `PXXX`: Program or code example.
- `XXX`: Exercise.
- `S00`: General chapter material that is not associated with a specific section.

Examples:

```
C01-S1.1.1-N001-procedures.md
C01-S1.1.1-N002-environment-model.md
C01-S1.1.1-P001-square.scm
C01-S1.1.1-P002-sum-of-squares.scm
C01-S1.1.2-X001-evaluate-expression.scm
C01-S00-N001-chapter-summary.md
```

The numbering of notes, programs, and exercises restarts within each section.

### Notes

Each note should be stored in its own file rather than combining all notes into a single document.

Notes should:

- Explain a concept, mechanism, or idea.
- Focus on a specific subject.
- Use a descriptive filename.
- Preserve the order in which notes were created through the `NXXX` identifier.
- Include related sections in the front matter when necessary.

### Code

Programs and code examples should be stored in the `code/` directory.

Code files should:

- Use the programming language and conventions of the book.
- Have a descriptive filename.
- Include the chapter, section, and program number.
- Represent examples, experiments, or implementations related to the notes.

### Exercises

Exercise solutions and experiments should be stored in the `exercises/` directory.

Exercise files should:

- Use the chapter and section of the original exercise.
- Include the exercise number when applicable.
- Use `XXX` as the content type.
- Have a descriptive filename when useful.

### General Chapter Notes

Material that applies to an entire chapter rather than a specific section should use `S00`.

Examples:

```
C01-S00-N001-chapter-summary.md
C01-S00-N002-main-concepts.md
C01-S00-P001-chapter-experiments.scm
```

## Notes

- The book is centered on abstraction and the construction of computational processes rather than on learning a specific programming language.
- The exercises and programming projects are an integral part of the material.
- Scheme is used as the primary vehicle for exploring programming concepts.
- The book should be approached with emphasis on understanding the underlying computational models and abstractions.

## Links

- MIT Press — Structure and Interpretation of Computer Programs: [https://mitpress.mit.edu/9780262510875/structure-and-interpretation-of-computer-programs/](https://mitpress.mit.edu/9780262510875/structure-and-interpretation-of-computer-programs/) 
- SICP — Official MIT Website: [https://web.mit.edu/6.001/6.037/](https://web.mit.edu/6.001/6.037/) 
- SICP — Online Text: [https://web.mit.edu/6.001/6.037/sicp.pdf](https://web.mit.edu/6.001/6.037/sicp.pdf)
