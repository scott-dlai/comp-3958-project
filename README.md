# Calculator in OCAML
COMP 3958\
Set V\
Name: Scott Lai (A01158559)\
Name: Tony Kim (A01005796)

## Installation

*NOTE*: you'll need corebuild and opam

1. Clone this project
```
git clone git@github.com:scott-dlai/comp-3958-project.git
```

2. Install `menhir` with `opam`
```
opam install menhir
```

3. Building this project. Simply run:
```
corebuild main.native
```
then a `_build/` will be created and a file called `main.native` will be created
in the same directory.

## Usage

Valid operators are `+`, `-`, `*`, `/`, `**` (exponenent operator), and brackets
