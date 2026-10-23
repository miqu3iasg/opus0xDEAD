# Computer Science Curriculum

A structured, self-directed Computer Science education built around textbooks, following the breadth and depth of rigorous undergraduate and graduate-level curricula from leading universities.

## About

This repository contains the materials, notes, exercises, implementations, and projects developed throughout a comprehensive self-directed education in Computer Science.

The curriculum is organized around books rather than individual online courses. Each book represents a course or a substantial component of the curriculum and has its own directory, identified by a unique abbreviation derived from the book's title. When applicable, the directory name also includes the edition number.

The goal is to build a coherent body of knowledge across the fundamental areas of Computer Science, progressing from mathematical and theoretical foundations to systems, algorithms, programming languages, software engineering, and advanced topics.

## Curriculum

The complete structure of the education is maintained in the `resources/` directory.

- `resources/catalogo-cursos-cs-es.pdf` — complete curriculum, course sequence, and overall organization.
- `exports/` — every PDF generated from the notes, mirroring the book and chapter structure.
- `<BOOK_ID>/` — individual book and its associated study materials.
- `<BOOK_ID>/meta.md` — metadata, overview, objectives, reading progress, and useful links.
- `<BOOK_ID>/` — exercises, implementations, notes, and other study material.

A book's directory name consists of its abbreviation, optionally followed by its edition number. For example, `ALG4` identifies _Algorithms_, 4th edition; `DISMATH8` identifies _Discrete Mathematics and Its Applications_, 8th edition; and `MCS` identifies _Mathematics for Computer Science_, for which no edition number is included in the directory name.

## Structure

```text
.
├── resources/
│   ├── templates/
│   └── catalogo-cursos-cs-es.pdf
│
├── templates/
│   ├── meta-template.md
│   ├── notes_en.tex
│   └── notes_pt-br.tex
│
├── exports/                  # all generated PDFs, mirroring the tree below
│   ├── <BOOK_ID>/
│   │   └── C01-<chapter-title>/
│   │       └── notes/
│   └── ...
│
├── .build/                   # compilation byproducts (not versioned)
│
├── <BOOK_ID>/
│   ├── meta.md
│   ├── resources/
│   ├── templates/
│   ├── C01-<chapter-title>/
│   │   ├── notes/
│   │   └── exercises/
│   ├── C02-<chapter-title>/
│   │   ├── notes/
│   │   └── exercises/
│   └── ...
│
├── <BOOK_ID>/
│   ├── meta.md
│   ├── resources/
│   ├── templates/
│   ├── C01-<chapter-title>/
│   │   ├── notes/
│   │   └── exercises/
│   └── ...
│
└── README.md
```

Material within each book directory is organized by chapter, with separate subdirectories for notes and exercises. Code is kept alongside notes rather than in a separate directory, since code files are also annotated with explanatory comments and serve as notes in their own right. The exact internal structure of each book directory may vary according to the nature of the material — see [Naming Convention](#naming-convention) below for the full file and directory naming rules.

## Templates

The root `templates/` directory holds the base templates used across the entire repository:

- A template for each book's `meta.md`, defining the standard fields every book index should have, including bibliographic information, subject and scope, objectives, progress, and links.
- A template for LaTeX notes, used as the starting point for the long-form, typeset version of study notes.

Each book also has its own `templates/` directory. It carries copies of the relevant templates, pre-filled with information specific to that book — title, bibliography, author, and other metadata that would otherwise have to be re-entered by hand every time a new note or the book's `meta.md` is created. This keeps the root templates generic and reusable, while the per-book copies remove repetitive setup work.

The `resources/templates/` directory holds shared resources and templates that do not belong exclusively to an individual book.

Notes are intentionally kept in two forms: the working Markdown/code notes described below, and a typeset PDF version. This redundancy is deliberate — long-term permanence of the notes matters, and having both a lightweight working format and a polished, typeset archival format is a goal in itself, independent of strict necessity.

## Book Organization

Each book directory is centered around a primary textbook.

The `meta.md` file inside each book directory serves as the book index and contains:

- Book and author information.
- Subject and scope.
- Learning objectives.
- Reading progress.
- Relevant notes.
- Useful external resources.

Study artifacts are kept separately from `meta.md` so that the metadata remains concise and easy to inspect.

## Exports

All PDFs live in a single `exports/` directory at the root of the repository, regardless of whether they came from Markdown (through Pandoc), LaTeX or Typst. Books do not have their own `exports/` folder. Inside `exports/`, each PDF sits at the same relative path as its source note, so `ALG4/C01-intro/notes/C01-S1.1-N001-basics.md` becomes `exports/ALG4/C01-intro/notes/C01-S1.1-N001-basics.pdf`. Mirroring the path is what keeps two books with identically named notes from overwriting each other, since filenames do not repeat the book identifier.

Compilation byproducts, such as the auxiliary files, logs and SyncTeX data that LaTeX produces, go to a hidden `.build/` directory at the root, mirrored the same way. It is never versioned. Only the PDFs in `exports/` are committed, and the LaTeX source itself is not versioned, which keeps the repository focused on the finished, permanent artifact rather than the intermediate source used to produce it.

The location is decided by one shared module in the Neovim configuration, which treats the repository root (the folder containing `.git`) as the base. Notes can therefore be written anywhere in the repository and the output still lands in the same place. PDFs of private notes, which live in directories beginning with `_`, are not versioned either (see [Private Material](#private-material)).

## Naming Convention

Each book directory is identified by an abbreviation derived from its title. When applicable, the abbreviation is followed directly by the edition number, without a separator. The edition number is optional.

Examples of book directory names include:

- `ALG4` — _Algorithms_, 4th edition.
- `DISMATH8` — _Discrete Mathematics and Its Applications_, 8th edition.
- `MCS` — _Mathematics for Computer Science_.
- `CODETHL` — _Code: The Hidden Language of Computer Hardware and Software_.
- `SICP` — _Structure and Interpretation of Computer Programs_.

The abbreviation should be descriptive, recognizable, and sufficiently distinct from those of other books in the repository. Edition numbers are included when applicable and useful for distinguishing a specific edition.

Within each book directory, material is organized by chapter, with separate subdirectories for notes and exercises.

```text
<BOOK_ID>/
├── meta.md
├── resources/
├── templates/
├── C01-<chapter-title>/
│   ├── notes/
│   └── exercises/
├── C02-<chapter-title>/
│   ├── notes/
│   └── exercises/
└── ...
```

There is no separate `code/` directory. Code files also serve as notes — they are written with explanatory comments — so they live in `notes/` alongside conceptual notes, distinguished by their content type (`PXXX`, see below).

Since the book identifier is already given by the directory itself, it does not need to be repeated in filenames.

### File Naming

Files follow the general format:

```text
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
- `XXXX`: Exercise.
- `S00`: General chapter material not tied to a specific section.

The numbering of notes, programs, and exercises restarts within each section.

Examples:

```text
notes/C01-S1.1.1-N001-procedures.md
notes/C01-S1.1.1-P001-square.scm
exercises/C01-S1.1.2-X001-evaluate-expression.scm
notes/C01-S00-N001-chapter-summary.md
```

Any book-specific conventions (e.g. programming language used, exercise style) are documented in that book's own `meta.md`.

## Progress

Reading progress is tracked directly in each book's `meta.md` using Markdown checkboxes.

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
_drafts/
_notes/
_private/
```

This allows personal or unpublished material to coexist with the public portion of the repository without being committed to Git.

## Repository Conventions

- Each book has a unique directory identifier derived from its title, optionally followed by its edition number.
- Each book directory contains a `meta.md`.
- `meta.md` contains bibliographic information, book metadata, and reading progress.
- Book-specific material stays inside its corresponding book directory.
- The root `templates/` directory holds the base `meta.md` and LaTeX note templates; each book keeps its own pre-filled copies under its own `templates/`.
- Shared resources and templates are kept in `resources/`.
- All generated PDFs, from Markdown, LaTeX and Typst notes, are kept in the single root `exports/` folder, mirroring the path of their source note.
- Compilation byproducts go to the hidden root `.build/` folder and are never versioned.
- Directories beginning with `_` are private.
- Generated files and build artifacts are excluded from version control, with the exception of the PDFs in `exports/`, which are kept intentionally.
- External resources are recorded in the `Links` section of the corresponding `meta.md`.

## Status

This curriculum is a long-term project and is expected to evolve over time.

Books may be added, removed, reordered, or replaced as the overall structure is refined.

The current curriculum and its organization can always be found in:

`resources/catalogo-cursos-cs-es.pdf`
