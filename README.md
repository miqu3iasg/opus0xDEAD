# Computer Science Curriculum

A structured, self-directed Computer Science education built around textbooks, following the breadth and depth of rigorous undergraduate and graduate-level curricula from leading universities.

## About

This repository contains the materials, notes, exercises, implementations, and projects developed throughout a comprehensive self-directed education in Computer Science.

The curriculum is organized around books rather than individual online courses. Each book represents a course or a substantial component of the curriculum and has its own directory, identified by a unique course code.

The goal is to build a coherent body of knowledge across the fundamental areas of Computer Science, progressing from mathematical and theoretical foundations to systems, algorithms, programming languages, software engineering, and advanced topics.

## Curriculum

The complete structure of the education is maintained in the `curriculum/` directory.

- `curriculum/catalogo-cursos-cs-es.pdf` — complete curriculum, course sequence, and overall organization
- `<COURSE_CODE>/` — individual course based on a textbook
- `<COURSE_CODE>/meta.md` — metadata, overview, objectives, reading progress, and useful links
- `<COURSE_CODE>/` — exercises, implementations, notes, and other study material

## Structure

```text
.
├── curriculum/
│   └── meta.md
│
├── templates/
│   ├── meta-template.md
│   └── notes_en.tex
│   └── notes_pt-br.tex
│
├── <COURSE_CODE>/
│   ├── meta.md
│   ├── resources/
│   ├── templates/
│   ├── exports/
│   ├── C01-<chapter-title>/
│   │   ├── notes/
│   │   └── exercises/
│   ├── C02-<chapter-title>/
│   │   ├── notes/
│   │   └── exercises/
│   └── ...
│
├── <COURSE_CODE>/
│   ├── meta.md
│   ├── resources/
│   ├── templates/
│   ├── exports/
│   ├── C01-<chapter-title>/
│   │   ├── notes/
│   │   └── exercises/
│   └── ...
│
└── README.md
```

Material within each course is organized by chapter, with separate subdirectories for notes and exercises. Code is kept alongside notes rather than in a separate directory, since code files are also annotated with explanatory comments and serve as notes in their own right. The exact internal structure of each course directory may vary according to the nature of the material — see [Naming Convention](#naming-convention) below for the full file and directory naming rules.

## Templates

The root `templates/` directory holds the base templates used across the entire repository:

- A template for each course's `meta.md`, defining the standard fields every course index should have (book and author information, subject and scope, objectives, progress, links).
- A template for LaTeX notes, used as the starting point for the long-form, typeset version of study notes.

Each course also has its own `templates/` directory. It carries the same templates as the root, but pre-filled with information specific to that course — title, bibliography, author, and other metadata that would otherwise have to be re-entered by hand every time a new note or the course's `meta.md` is created. This keeps the root templates generic and reusable, while the per-course copies remove repetitive setup work.

Notes are intentionally kept in two forms: the working Markdown/code notes described below, and a typeset LaTeX/PDF version. This redundancy is deliberate — long-term permanence of the notes matters, and having both a lightweight working format and a polished, typeset archival format is a goal in itself, independent of strict necessity.

## Course Organization

Each course is centered around a primary textbook.

The `meta.md` file inside each course directory serves as the course index and contains:

- Book and author information
- Subject and scope
- Learning objectives
- Reading progress
- Relevant notes
- Useful external resources

Study artifacts are kept separately from `meta.md` so that the metadata remains concise and easy to inspect.

Each course directory also contains an `exports/` folder, where the PDFs generated from the course's LaTeX notes are kept. The LaTeX source itself is not versioned — only the resulting PDF is committed, via `exports/`. This keeps the repository focused on the finished, permanent artifact rather than the intermediate source used to produce it.

## Naming Convention

Within each course directory, material is organized by chapter, with separate subdirectories for notes and exercises.

```text
<COURSE_CODE>/
├── meta.md
├── resources/
├── templates/
├── exports/
├── C01-<chapter-title>/
│   ├── notes/
│   └── exercises/
├── C02-<chapter-title>/
│   ├── notes/
│   └── exercises/
└── ...
```

There is no separate `code/` directory. Code files also serve as notes — they are written with explanatory comments — so they live in `notes/` alongside conceptual notes, distinguished by their content type (`PXXX`, see below).

Since the course code is already given by the directory itself, it does not need to be repeated in filenames.

### File Naming

Files follow the general format:

```
CXX-SX.X.X-TXXX-description.ext
```

Where:

- `CXX`: Chapter identifier.
- `SX.X.X`: Section identifier, based on the source book.
- `TXXX`: Content type and sequential number.
- `description`: Short, descriptive name.
- `ext`: File extension.

### Content Types

- `NXXX`: Note.
- `PXXX`: Program or code example, annotated with explanatory comments — stored in `notes/` alongside conceptual notes, since it doubles as one.
- `XXX`: Exercise.
- `S00`: General chapter material not tied to a specific section.

The numbering of notes, programs, and exercises restarts within each section.

Examples:

```
notes/C01-S1.1.1-N001-procedures.md
notes/C01-S1.1.1-P001-square.scm
exercises/C01-S1.1.2-X001-evaluate-expression.scm
notes/C01-S00-N001-chapter-summary.md
```

Any book-specific conventions (e.g. programming language used, exercise style) are documented in that course's own `meta.md`.

## Progress

Reading progress is tracked directly in each course's `meta.md` using Markdown checkboxes.

For example:

```markdown
- [ ] Chapter 1 — Introduction
- [x] Chapter 2 — Fundamentals
- [ ] Chapter 3 — Advanced Topics
```

A checked item indicates that the corresponding material has been completed.

Completion of a chapter does not necessarily imply mastery. The curriculum is intended to involve reading, problem solving, implementation, experimentation, and review.

## Philosophy

This curriculum is based on several principles:

- Fundamentals before specialization.
- Understanding before memorization.
- Mathematical rigor where appropriate.
- Programming as a means of understanding computational concepts.
- Theory and practice should reinforce each other.
- Exercises are part of the learning process, not optional supplements.
- Books are treated as primary sources of structured knowledge.
- External resources are used when they improve understanding, not merely to increase the amount of material.
- Depth is preferred over superficial coverage.

The purpose is not simply to collect completed books. The purpose is to develop a coherent understanding of Computer Science and the ability to apply that knowledge independently.

## Sources

The curriculum draws inspiration from established Computer Science programs and their course structures, particularly programs from leading universities.

Books are selected according to the role they play in the curriculum rather than solely according to popularity or convenience.

The curriculum may therefore combine textbooks from different institutions and authors when doing so provides a stronger overall education.

## Private Material

Directories beginning with `_` are considered private and are intentionally excluded from version control.

```text
_private/
_notes/
_drafts/
```

This allows personal or unpublished material to coexist with the public portion of the repository without being committed to Git.

## Repository Conventions

- Each course has a unique course code.
- Each course directory contains a `meta.md`.
- `meta.md` contains course metadata and reading progress.
- Course-specific material stays inside its corresponding course directory.
- The root `templates/` directory holds the base `meta.md` and LaTeX note templates; each course keeps its own pre-filled copy under its own `templates/`.
- Generated PDFs from LaTeX notes are kept in each course's `exports/` folder; the LaTeX source itself is not versioned.
- Directories beginning with `_` are private.
- Generated files and build artifacts are excluded from version control, with the exception of the PDFs in `exports/`, which are kept intentionally.
- External resources are recorded in the `Links` section of the corresponding `meta.md`.

## Status

This curriculum is a long-term project and is expected to evolve over time.

Courses may be added, removed, reordered, or replaced as the overall structure is refined.

The current curriculum and its organization can always be found in:

`curriculum/catalogo-cursos-cs-es.pdf`
