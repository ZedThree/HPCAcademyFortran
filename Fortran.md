---
title: Introduction to Fortran
author: Peter Hill
classoption: aspectratio=169
theme: York169dark
header-includes: \usepackage{pandoc-solarized}
monofont: Inconsolata LGC
---

# Session 1

## Overview

- A brief history of Fortran
- Some programming fundamentals
- Hello World
- Types and variables
- Basic grammar and operations
- Control flow

## Course content

- Some experience of programming in some language very useful
- But I don't assume much!
- Covers Fortran language
- Other people covering floating point maths, compilation,
  performance, parallelisation
- One/two practical sessions on the basics, but most hands-on in the
  target application sessions

## What is Fortran?

- old language! 1956 -- 62 years old
    - oldest "high-level" language
    - many versions over the years, latest is 2018! And next one is
      being worked on as we speak
- some parts feel outdated
    - backwards compatibility is important
    - but original reasons for some features no longer hold
- but still in use for good reason!
- can be _very_ fast
- native multidimensional arrays
    - very useful for scientists!

## What is Fortran?

- Compiled language
    - compare with Python as interpreted language
- Statically typed:
    - types of variables must be specified at compile time and cannot
      be changed
    - "strong" typing, compare with C, easy to change types
- Imperative: commands executed in order
    - compare with SQL, Make, where commands are "what" vs "how"

## Brief history of Fortran

- First release in 1956, FORTRAN
    - Not the first high-level language, but the first successful one
    - Let people write programs much faster, rather than in assembly
- Massively successful, ported to more than 40 different systems
- Early computers had no disks, text editors or even keyboards!
- Programs were made on punchcards

![By Arnold Reinhold, CC BY-SA 2.5,
https://commons.wikimedia.org/w/index.php?curid=775153](./FortranCardPROJ039.agr.jpg){width=50%}

## Brief history of Fortran

- FORTRAN II added functions (!)
- FORTRAN IV eventually got standardised and became FORTRAN 66
    - Starting to look like a "modern" programming language
- Next standard, FORTRAN 77, added lots of modern features
    - But still tied to format of punchcards!
- Fortran 90 finally brought language up to modern era
    - "Free" form source code
    - Made lots of "spaghetti" code features obsolescent
    - Added whole array operations, modules, derived data types
- Further revisions:
    - Fortran 95 - minor revision to F90
    - Fortran 2003 - major revision, support for object-oriented programming
    - Fortran 2008 - native support for parallelisation via coarrays
    - Fortran 2018 - minor revision to F2008, more support for
      parallelisation and interoperability with C

## Why Fortran?

- Built for efficient mathematical calculations
- Makes it easy to write simple code that optimises well
    - For "reasonable" use cases!
- Multidimensional arrays are first-class objects
- Support for basic input files built in
- Easily fits into various parallel programming paradigms
    - Some even built right into language
- Majority of codes on UK supercomputers use Fortran
    - fluid dynamics, materials, plasmas, climate, etc.
- Portable code, several compilers available
- Interoperability features (can work with C easily)

## Why not Fortran?

- Not great at problems outside of "usual" domain
    - Text processing, graphical interfaces, system programming
    - Still possible, just harder than in specialist languages!
- Historical baggage has left a very verbose language
    - Lots of typing!
- Lack of proper generics make some useful data structures tricky to
  implement
- Slow support from compiler vendors

## Alternatives

- C++
    - Templates make it possible to express generic operations
    - Can get "close to the metal", can get very good performance
    - Multidimensional array support poor (no native support,
      libraries exist)
- Python
    - Easier to use!
    - Possible cost of performance (but e.g. `numpy` uses C or Fortran
      under the hood!)
- Matlab
    - Expensive!

## Fundamentals of Programming

- Computers understand machine code -- 1s and 0s
- e.g. a `square` function might look like:
```
111100110000111100010000000001111111001100001111010110011100000011000011
```
- Exact number depends on exactly what physical processor you want to
  run on!
- We would much prefer to write in a human language
- "Lowest" level language is _assembly_, which just gives names to the
  _op codes_:
```nasm
        movss  xmm0,DWORD PTR [rdi]  ;; f3 0f 10 07
        mulss  xmm0,xmm0             ;; f3 0f 59 c0
        ret                          ;; c3
```
- Source code is human-readable set of instructions for computer:
```Fortran
        square = x * x
```

## Fundamentals of Programming

- Higher level language can abstract over assembly complications
- Need a program to convert source to machine code
- Either:
    - interpreted, like Python, convert on the fly
    - compiled, like Fortran, convert then run
- Compilation step offers opportunity to spend time _optimising_ the
  code
    - unoptimised version of `square` above is 9 times longer!

## Fundamentals of Programming

- Source code is written in plain text files (i.e. not Word!)
- Run compiler on source file to produce _executable_
- Programming languages have a strict _syntax_ or grammar
- Compiler will tell you if you get this wrong
    - Read the error message, then read it again!
- Compiler can also _warn_ you about suspicious code
- Compilers have many options or _flags_ to control warnings, errors,
  optimisations, etc.

## Fundamentals of Programming

- Source code is read more times than it is written, by factor 5 or
  more
- We use high-level languages in order to be understandable to humans
- Therefore, more important to write _readable_ code than _efficient_
  code
- Even more important that it is correct
- Make it work -> make it readable -> make it fast
    - In that order!


## Some conventions

- `<something>` means "something" is mandatory, but up to you
- `{something}` means "something" is optional, but has to be exactly `something`
    - `{<something>}` means "something" is optional and up to you!
- These two are red in code blocks, as they won't compile!
- If a code block has numbers on the left, it's from an example file,
  which will be available from
  <https://github.com/ZedThree/HPCAcademyFortran/tree/master/examples>
- I usually don't show the whole file, but the whole file will compile
  and work
- I don't always follow best practices to make things fit on slides!
    - Do as I say, not as I do!


## Hello world

```{include=examples/01_hello_world.f90 .numberLines .Fortran}
```

- Lines 1 & 5: All programs must start with `program <label>` and end
  with `end program <label>`
- Line 2: `implicit none`: Historical reasons! Old Fortran had implicit
  typing: more on this later
- Line 3: A comment, begins with `!` (ignore everything after this)
- Line 4: Print some text to screen

## Compiling code

This will be covered more in depth later on

Basic compilation is as so:

- `gfortran source.f90` -> `a.out`
- `gfortran source.f90 -o executable` -> `executable`

And running like

- `./executable`

## Compiler flags

Some basic, very helpful flags you should use:

- `-Wall`: "commonly used" warnings
- `-Wextra`: additional warnings
- `-fcheck=all`: various run-time checks
    - This isn't free!
- `-g`: debug symbols
    - Can give better error messages, required for debuggers like
      `gdb`
- `-O1`/`-O2`/`-O3`: optimisations
    - Can speed up code at cost of longer compile times

Full compile line might look like:

- `gfortran -Wall -Wextra -fcheck=all -g -O2 hello.f90 -o hello`

Build systems like `CMake` or `Makefile` help simplify this

## Types

There are 5 fundamental types in Fortran:

- `integer`
- `real` -- floating point numbers
- `logical` -- booleans, two values: `.true.`/`.false.`
- `character` -- text, also called strings
- `complex` -- floating point complex numbers

(later, we will look at derived types)

## What, exactly, is a type?

- Computers store _everything_ in binary, ones and zeros, called _bits_
- Given a set of bits, what does it mean?
    - Could be a number, could be some text
    - Could be an instruction!
- Binary: `00000000000000001001011001110000`
- As an `integer`: `38512`
- As a `real`: `5.39668e-41`
- As a `character`: `p`
- As an instruction: `XCHG`

## What, exactly, is a type?

- We need to tell computer how to interpret the set of bits
    - We're free to lie to the computer and change our minds about how
      to interpret a given set of bits
- Would be very tedious if we had to tell the computer every time we
  wanted to do an operation on some bits what type they represented
    - plus potential for mistakes
- Types tell the _compiler_ our intent: these bits are an integer,
  those are text
- Compiler then checks we're doing sensible things
    - `4 + 6` makes sense
    - `4 + "hello"` doesn't make any sense
    - `4 + 5.3` might do

## Literals

- Very common to need _literally_ "this value"
- `integer`:
    - `1`, `-2`, `1e3`, `42`
- `real`:
    - `2.`, `0.3`, `4.6E4`, `0.02e-3`
    - Note: `real` literals are single-precision by default (more on
      this later)
- `complex`:
    - `(0.0, 1.0)`, `(3.2, 4.3e9)`
- `character`:
    - `"either double quotes"`, `'or single quotes are fine'`
- `logical`:
    - `.true.`, `.false.`
    - But often printed as `T` and `F`!

## Variables

- A variable is label for some value in memory used in a program
- In Fortran, we must tell the compiler up front what type a variable
  is, and this is fixed
    - In other languages, like Python, we can change our minds
- Variables are declared like:

```Fortran
    <type> :: <name> {, <name>}
```
- Note: `::` not always needed, but never hurts!

```Fortran
    integer :: grid_points
    real :: energy, mass
```

## Variable names

- Variable names must start with a letter, and are limited to ASCII
  lower/uppercase, numbers and underscore
- Valid:
    - `a`, `NUMBER5`, `nitrogen_mass`, `O2_concentration`
- Invalid:
    - `1a`: must start with a letter
    - `_b`: must start with a letter
    - `Pounds£`: contains non-valid character `£`
    - `a-b`: parsed as "subtract `b` from `a`"

## Variable names

- Pick variable names wisely!
    - in F2003, you can have up to 63 characters in a name
- Good names:
    - `distance_to_next_atom`
    - `temperature`
    - `total_energy`
- Less good names:
    - `distnxtatm`
    - `temp`
    - `E`
- "Writing code is a form of communication" - Kate Gregory
- Be kind to future readers, dnt ndlssly shrtn nms
- Your code will live longer than you think!

## Hello world again

```{include=examples/02_hello_input.f90 .numberLines .Fortran}
```

- Line 3: `character(len=20)`: we need to say up-front how long how strings
  are via the `len` type parameter (we'll cover this a bit more later on)
- Line 6: `read*,`: read a variable from stdin/command line
- Line 9: `&`: line continuation for long lines

## What's this `implicit none`?

- Always, **always** use `implicit none`
- Early Fortran done on punch cards
- Assume anything starting with `i-n` is an `integer`, otherwise it's
  `real`
- Very easy to make a tpyo and use an undefined value, get the wrong
  answer
- One `implicit none` at the top of the program (or module, see later)
  is sufficient
    - You may like to keep it in every function, see later

## Some points on Fortran grammar: whitespace

- Whitespace mostly doesn't matter:

```{include=examples/bad_whitespace.f90 .numberLines .Fortran
startFrom=1 startLine=1 endLine=5}
```

- But very important for readability!

```{include=examples/good_whitespace.f90 .numberLines .Fortran
startFrom=1 startLine=1 endLine=5}
```

## Some points on Fortran grammar: whitespace

- Matter of personal taste, but go for readability over prettiness
- Prefer one space around operators (`+`, `*`, `=`, etc.)
- Prefer one space after "punctuation" (`:`, `,`)
- Vertical whitespace also affects readability
- Also note: tabs are not standard Fortran! Use spaces for indentation

## Some points on Fortran grammar

### Lines
- Statements must be on a single line unless you use a `&`, _line
  continuation_
  ```Fortran
  if (some_very_long_and_complicated_condition > some_other_very_long_and_complicated_condition) then
  ```
  can be rewritten as
  ```Fortran
  if (some_very_long_and_complicated_condition &
      > some_other_very_long_and_complicated_condition) then
  ```
- Optional to put `&` at start of next line
- Maximum of 256 lines (i.e. 255 `&`)
- Prefer to put operators at the beginning of lines


## Some points on Fortran grammar

### Capitalisation
- Fortran is (almost) completely case-insensitive
    - Inside strings matters, but keywords and variable names don't
```Fortran
iF (eNeRgY > cRiTiCaL_eNeRgY) tHen
```
is _identical_ to
```Fortran
if (energy > critical_energy) then
```
but one is easier to read
    - Originally didn't have lower-case characters at all!
- Prefer lower-case keywords
- Careful with names!
- You may prefer `snake_case` for variable names

## Some points on Fortran grammar

### File names

- The standard doesn't mention source files _at all_
- Linux also doesn't care about file extensions
- Early, fixed-form sources files used `.f` file extension
- With Fortran 90, people started using `.f90` for free-form source
  files
- Some people thought that `.f95`, `.f03`, etc. should be used for
  later standards
- Not the case!
- Just use `.f90` and you'll be fine


## Arithmetic operations

- Usual mathematical operators: `+, -, *, /`
- Plus `**` for exponentiation
    - Careful you only use integers unless you mean it
- BODMAS/PEDMAS and left-to-right, but use `()` to clarify
    - Don't forget, make it _readable_

```{include=examples/03_basic_maths.f90 .numberLines .Fortran
startLine=3 endLine=10 startFrom=3}
```

## Mixed-type operations

- Not uncommon to want to mix types in arithmetic, e.g.
    - `integer :: n` points of `real :: grid_spacing`
- This will _promote_ the different types to be the same type/kind
- Result may end being _demoted_ to fit the result type
- Possible to lose information this way, but compiler _may_ warn you!

## Integer division

- When dividing two `integer`s, the result is an `integer` truncated
  towards zero
- This may be surprising!
- `5 / 2 == 2`
- Therefore, if you need the result to be a `real`, either convert (at
  least) one operand to `real`, or use a `real` literal

```{include=examples/0x_integer_division.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=7}
```


## Logical/relational operations

- `<` `>`: Less/greater than
- `<=` `>=`: Less/greater than or equal to
- `==`: Equal to
- `/=`: Not equal to
    - Note the inequality operator! Might look odd if you come from
      C-like languages or Python
    - This operator is essentially why Fortran doesn't have short-hand
      operators like `a *= b`
- Also wordier versions:
    - `.lt.`, `.le.`, `.gt.`, `.ge.`, `.eq.`, `.ne.`
    - But don't use these!

```{include=examples/04_logical_operators.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=6}
```

## Intrinsic functions

- Built-in to language
- Lots of maths!
    - `sin`, `cos`, etc.
    - F2008 has things like `hypot`, `bessel_j0`, `erf`, `norm2`
- Use them if they exist -- can be heavily optimised by compiler
    - Difficult to detect if they are available of course

```{include=examples/intrinsic_functions.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=6}
```

## Control flow

- Often need to change exactly what happens at runtime
- `if` statement allows us to take one of a number of _branches_ depending on
  the value of its _condition_

```Fortran
if (<logical-expression>) then
  ! do something
end if
```

- If `<logical-expression>` evaluates to `.true.` then the statements
  inside the _construct_ are executed
- Otherwise, we carry on executing after the `end if`

## Control flow

- More generally:

```Fortran
if (<logical-expression-1>) then
  ! do something 1
else if (<logical-expression-2>) then
  ! do something 2
else
  ! do something 3
end if
```

- Bare `else` must be last
- Also note that brackets `()` are mandatory here

## Control flow

- Conditions are checked from the top:

```{include=examples/05_if_statement.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=12}
```

## Logical/boolean operations

- `.and.`, `.or.`, `.not.`


```{include=examples/06_logical_boolean_operations.f90 .numberLines
.Fortran
startLine=3 endLine=8 startFrom=3}
```

- Note for those familiar with other languages: Fortran does not have
  shortcut logical operations
    - Line 4 above _may_ evaluate _both_ conditions!
- Also note that `logical`s must be compared with `.eqv.` and not `==`
  or `.eq.`
    - But you will probably never use this!

## Loops

- Often want to repeat some bit of code/instructions for multiple
  values
    - Could write everything out explicitly
- `do` _loops_ are a way of doing this
- three slight variations:

```Fortran
do
  ! do something
end do
```

```Fortran
do while (<logical-expression>)
  ! do something
end do
```

```Fortran
do <index> = <lower-bound>, <upper-bound>
  ! do something
end do
```

## Loops

- All three forms essentially equivalent
- Bare `do` needs something in body to `exit` loop
- `do while` loops _while_ the condition is true, and does the loop
  _at least once_
- Last form does `<upper-bound> - <lower-bound> + 1` loops
    - loop variable (`<index>`) must be pre-declared
    - lower and upper bounds are your choice

## Bare `do`

- Notice nothing to say when loop is done!

```{include=examples/07_infinite_do.f90 .numberLines .Fortran
startLine=3 endLine=7 startFrom=3}
```

## `exit`

- We can use `exit` to leave a loop
- Leaves current loop entirely

```{include=examples/08_do_exit.f90 .numberLines .Fortran
startLine=3 endLine=8 startFrom=3}
```

## `do while`

- Equivalent to using `exit` at start of loop

```{include=examples/09_do_while.f90 .numberLines .Fortran
startLine=3 endLine=7 startFrom=3}
```

- Unlike C++, `do while` checks the condition at the _beginning_ of the loop:

```{include=examples/10_do_while_none.f90 .numberLines .Fortran
startLine=3 endLine=7 startFrom=3}
```

## `do <counter> = <start>, <stop> {, <stride>}`

- Most common form of the `do` loop is with a counter
- Must be an integer and declared before-hand
- `start` and `stop` are required, `counter` goes from `start` to
  `stop` _inclusive_:

```{include=examples/11_do_counter.f90 .numberLines .Fortran
startLine=3 endLine=6 startFrom=3}
```

## `do <counter> = <start>, <stop> {, <stride>}`

- There is an optional `stride`:

```{include=examples/12_do_stride.f90 .numberLines .Fortran
startLine=3 endLine=6 startFrom=3}
```

- Note that `stop` might not be included if `stride` would step over
  it

## A couple of points on `do`

- It's ok for `stop` < `start`: just won't be executed
- `stride` can be negative:

```{include=examples/13_do_negative_stride.f90 .numberLines .Fortran
startLine=3 endLine=6 startFrom=3}
```

- You cannot change the value of the loop `counter` inside a loop
- Value of `counter` not defined outside loop
    - Likely to take on last value after loop, but absolutely do not
      rely on it!
    - Compiler free to optimise it away

# Session 3

## Overview

- Arrays
- Parameters
- Kinds
- Procedures (functions and subroutines)

## Arrays

- Arrays are one of the "killer features" of Fortran
    - Big reason why it's lasted so long!
- Vector in 3D space could be 1D array of 3 elements:

```{include=examples/array_basics.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=5}
```

- Fortran can natively handle multidimensional arrays:

```{include=examples/array_multidimensions.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=5}
```

- `matrix1` has 3x3 = 9 elements

## Array indexing

- We can _index_ an array using an integer:

```{include=examples/array_basics.f90 .numberLines .Fortran
startFrom=9 startLine=9 endLine=13}
```

- We can even take a _slice_ using the `:` notation:

```{include=examples/array_basics.f90 .numberLines .Fortran
startFrom=14 startLine=14 endLine=14}
```

- We can optionally leave off the lower and/or upper bounds:

```{include=examples/array_multidimensions.f90 .numberLines .Fortran
startFrom=16 startLine=16 endLine=19}
```

## Arrays

- **Note:** By default, Fortran indices start at 1!
- Can change this:

```{include=examples/array_indices.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=8}
```

- 1D array, 3 values with indices `-1, 0, 1`
- Note array bounds separated with `:`, dimensions (or _ranks_) with
  `,`:

```Fortran
real, dimension(-1:1, 3:5) :: stress_tensor
```

- Still 3x3, but first dimension has indices `-1, 0, 1`, and second
  has `3, 4, 5`

## Literal arrays

- Just like scalar types have literals, so do arrays
- Wrap the scalar values in square brackets `[<values>...]`
    - Older style is `(/<values>.../)`
- Can use this to initialise or assign to arrays:
```{include=examples/array_constructors.f90 .numberLines .Fortran
startFrom=5 startLine=5 endLine=5}
```
- Or even pass to functions:
```{include=examples/array_constructors.f90 .numberLines .Fortran
startFrom=15 startLine=15 endLine=15}
```
- Unfortunately, only works for 1D arrays! Multidimensional arrays
  need to use `reshape`

### FIXME

reshape example


## Constructing arrays

- How to fill an array with 10 values between $0$ and $2\pi$?
- Could do:

```Fortran
array(1) = 0.
array(2) = 2. * pi * (1. / 10.)
array(3) = 2. * pi * (2. / 10.)
...
! or
do i = 1, 10
    array(i) = 2. * pi * (real(i - 1) / 10.)
end do
```

- This can be written a bit more compactly using an _implied do_:

```{include=examples/array_constructors.f90 .numberLines .Fortran
startFrom=10 startLine=10 endLine=10}
```

- Not always the best tool, but sometimes very useful!

## Operations with arrays

- We can element-wise operations on arrays very simply:

```{include=examples/array_basics.f90 .numberLines .Fortran
startFrom=18 startLine=18 endLine=23}
```

- Notice how we can use both scalars and arrays in these operations?

## Conformability

- When working with multiple arrays, need to make sure shapes
  _conform_ (i.e. match exactly)
    - Useful intrinsic, `shape`, to tell you the shape!
- Scalars conform with everything
- Slices with the same shape conform (even if upper/lower bounds don't
  match)

```{include=examples/array_conformability.f90 .numberLines .Fortran
startFrom=4 startLine=4 endLine=12}
```

## Conformability

```{include=examples/array_conformability.f90 .numberLines .Fortran
startFrom=19 startLine=19 endLine=29}
```

##

### FIXME

- whole array operations
- useful intrinsics

## Memory layout

- Brief aside into computer architecture
 - Computer memory is indexed by a linear series of addresses
 - Usually written in hexadecimal
     - e.g. 0x07FFAB43
 - When we want to store multidimensional arrays, need to store them
   "flattened"
 - Also need to pick which is the "fastest" dimension, i.e. which is
   stored first in memory

## Memory layout

- Maths matrix:

![By Svjo - Own work, CC BY-SA 4.0,
https://commons.wikimedia.org/w/index.php?curid=79728977](./Matrix.png){width=50%}

## Memory layout

:::::: {.columns}
::: {.column}

- Two choices:
- $a_{11}$, $a_{12}$, $...$, $a_{1n}$, then $a_{21}$, $a_{22}$, $...$
- or $a_{11}$, $a_{21}$, $...$, $a_{m1}$, then $a_{12}$, $a_{22}$ $...$
- _Row-major_ or _column-major_

:::
::: {.column}

![By Cmglee - Own work, CC BY-SA 4.0,
https://commons.wikimedia.org/w/index.php?curid=65107030](./500px-Row_and_column_major_order.png){height=75%}

:::
::::::

## Memory layout

- What does this mean in practice?
- Nested loops over multidimensional arrays should have the inner-most
  loop go over the left-most rank:

  ```Fortran
  integer :: i, j, k
  real(real64), dimension(3, 3, 3) :: matrix

  do k = 1, 3
    do j = 1, 3
      do i = 1, 3
        matrix(i, j, k) = i + j +k
      end do
    end do
  end do
  ```

## Memory layout

- Assuming no loop-dependencies, answer is identical to reversing
  order of loops
- But performance can be very different!
    - order of magnitude!
- This is different from C-like languages

```{include=examples/0x_memory_order.f90 .numberLines .Fortran
startFrom=15 startLine=15 endLine=27}
```

## Useful intrinsics

- The basic mathematical intrinsic functions also work on arrays:
- `sin`, `cos`, `tan`, `sqrt`, `exp`, `log`, etc.

### FIXME

```Fortran
x = [0 to 2pi]
print*, x, sin(x)
```

## Useful intrinsics

There are many useful functions for working with arrays built in to
Fortran

Many of these intrinsics take an optional `dim` argument to take the
function just along that dimension

### Working with vectors/matrices
- `dot_product(vector_a, vector_b)`: Returns the dot product of two
  1D arrays of the same size
- `matmul(matrix_a, matrix_b)`: Returns the matrix multiplication of
  two matrices
- `product(array)`: Return the product of all the elements
- `sum(array)`: Return the sum of all the elements
- `norm2(array)`: Return the $L_2$ norm, essentially `sqrt(array**2)`

## Useful intrinsics

### Logical inquiries

- `all(mask)`: Returns true if all the elements in the logical array
  `mask` are true, otherwise returns false
    - `mask` can be an expression like: `all(array > 0)`
- `any(mask)`: True if any of the elements in `mask` are true
- `count(mask)`: Returns how many elements in `mask` are true (an
  integer)

## Useful intrinsics

### Finding elements and values
- `maxval(array)`: Returns the maximum value in `array`
- `minval(array)`: Returns the minimum value in `array`
- `maxloc(array [, mask])`: Returns the _location_ of the maximum
  value
- `minloc(array [, mask])`: Returns the _location_ of the minimum
  value
    - Get the element closest to `value`: `minloc(abs(array - value))`
- `findloc(array, value)`: Return the location of `value` in `array`
    - Note that this is not so useful for `real` arrays!

## Useful intrinsics

### Array size and shape inquiries

- `lbound(array)`: Return a 1D array of the lower bounds of `array`
- `ubound(array)`: Return a 1D array of the upper bounds of `array`
- `shape(array)`: Return a 1D array of the size of each dimension
- `size(array)`: Return a scalar of the total size of `array`
  (i.e. `product(shape(array))`)

## Useful intrinsics

### Making new arrays

- `merge(tsource, fsource, mask)`: Return `tsource` where `mask` is
  true and `fsource` where `mask` is false
- `spread(source, dim, ncopies)`:
- `transpose(array)`: Returns the transpose of a 2D array
- `reshape(source, shape [, pad] [, order])`: Returns a copy of
  `source` with `shape`. `pad` can be used to fill in values if the
  result is larger than `source`. `order` can be used to do a general
  $n$-D transpose

## Allocatable arrays

- If size of array not known until some time into the program
  execution, can use `allocatable` arrays to dynamically size them

```Fortran
! These two are equivalent:
real(kind=wp), dimension(:), allocatable :: array1
real(kind=wp), allocatable :: array2(:)
! 3D array:
real(kind=wp), dimension(:, :, :), allocatable :: array3
```

- The number of dimensions/rank must be known at compile time
    - Size of each dimension must be just `:`
- After declaration, we must use `allocate` before first use:

```Fortran
real(kind=wp), dimension(:, :), allocatable :: array
allocate(array(10, 5))
! array is now 10x5
```

## Allocatable arrays

- `array` is now `allocated`, but _uninitialised_
    - i.e. if we index it we will get nonsense
    - same state as a non-allocatable array before we fill it

- When finished with the array, we can `deallocate` it and free up the
  memory:

```Fortran
deallocate(array)
```

- Less important than C-like languages due to _automatic_ variables
  and scope -- will cover this later
- It is an error to `deallocate` an unallocated array, so:

```Fortran
if (allocated(array)) deallocate(array)
```

## Guarding `allocate`

- Possible to request more memory than available
- Good practice to always check `allocate` succeeds using `stat`
  argument
- Value of `stat` is non-portable and might not even be documented!
- Combine with `errmsg`:

```{include=examples/0x_allocate_stat.f90 .numberLines .Fortran
startFrom=9 startLine=9 endLine=17}
```
<!-- [examples/0x_allocate_stat.f90](examples/0x_allocate_stat.f90) -->

- Note `errmsg` may not always be accurate...
    - Bare `allocate` will terminate, possibly with more useful error
      message

## Aside: heap and stack

### FIXME

## Returning `allocatable` variables from functions

### FIXME

## `parameter`

- sometimes want a variable that can't be modified at runtime,
  e.g. `pi`
- or have lots of arrays of fixed size

```Fortran
real, dimension(10) :: x_grid_spacing, y_grid_spacing
real, dimension(10) :: x_grid, y_grid
real, dimension(10, 10) :: density
```

- What if you now need a 20x20 grid?
- use a `parameter`!
- fixed at compile time
    - has to be made of literals, other `parameter`s, intrinsics
- names are great!
- attribute (now we definitely need `::`)
- super useful for things like `pi`, `speed_of_light`,
  `electron_mass`, etc.

## `parameter` examples

```{include=examples/0x_parameters.f90 .numberLines .Fortran}
```

## `character` `parameter`s

- It can be a quite annoying to keep the `len` of a `character` in
  sync with how long it is
- For `character` `parameter`s though, we can use `len=*`

    ```Fortran
    character(len=*), parameter :: filename = "output.log"
    ```

- Only works for `parameter`s and dummy `intent(in)` arguments (see
  later) though!
- Non-constant `character`s can be `allocatable` with `len=:` though!

## `character` examples

```{include=examples/parameter_and_allocatable_characters.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=12}
```

## Kinds of types

- Most important for `real`s
- Floating point representation
- Doing lots of maths with floating point numbers can lose precision
  => need more precision in our `real`s
- Three old styles:
    - `double precision`: use twice the number of bytes as for `real`
        - Standard! but vague
    - `real*8`: use 8 bytes
        - Non-standard! never use this
        - You'll see it a bunch in old codes though
    - `real(8)` or `real(kind=8)`: use real of `kind` 8
        - Standard but non-portable!
        - What number represents what `kind` is entirely up to the
          compiler

### FIXME

- ranges of different kinds
- mention integers

## Kinds of types

- Don't use those! Use these:

```Fortran
! Get the kind number that can give us 15 digits of precision and 300
! orders of magntitude of range
integer, parameter :: wp = selected_real_kind(15, 300)
! Declare a variable with this kind
real(kind=wp) :: x
! Use a literal with this range
x = 1.0_wp
```

## Kinds of types

### `iso_fortran_env`
- Even better! F2008 feature, but use this and complain if stuck on a
  previous standard (upgrade compilers!)

```Fortran
use, intrinsic :: iso_fortran_env, only : real64
real(real64) :: x
x = 1.0_real64
```

- Can combine this with a `parameter`:

```Fortran
use, intrinsic :: iso_fortran_env, only : real64
integer, parameter :: wp = real64
real(kind=wp) :: x
x = 1.0_wp
```

## Kinds of types

- `real` literals are single precision by default, so need `kind`
  identifier

```{include=examples/loss_of_precision.f90 .numberLines .Fortran
startFrom=4 startLine=4 endLine=6}
```

- Mixed-kind operations will convert like mixed-type operations
- Lots of intrinsics take a `kind` argument:
    - `5._real64 / real(2, kind=real64) == 2.5_real64`


## Procedures

- Break programs up into building blocks
- Reusable components
    - Repeat tasks multiple times
    - Use same task in multiple contexts
- Procedures:
    - Functions
    - Subroutines
- Modules
    - Cover later
- Procedures are good:
    - easier to test
    - reuse
    - maintainability
    - abstraction
    - collaboration
- Encapsulation: hide internal details from other parts of the
  program. Program against the _interface_

## Procedures

### FIXME

- names are great
- internal procedures

## Procedures

- Two types of procedures:
    - `function`s
    - `subroutine`s
- Generically called _procedures_ or _subprograms_
- May also refer to them both as _functions_ -- will make it clear
  when I mean `function`s in particular

## Functions
- Takes arguments and returns a single result (may be array)
- Always returns a value
- Intrinsic functions, e.g. `sin(x)`, `sqrt(x)`
- syntax:

```Fortran
function <name>(<input>)
  implicit none
  <type>, intent(in) :: <input>
  <type> :: <name>
  ! body
  <name> = ! result
end function <name>
```

## Functions

- Result has the same name as the function, by default
- Can change this with `result` keyword

```{include=examples/0x_basic_function.f90 .numberLines .Fortran startLine=8 endLine=16}
```

## Functions

- Functions in `program`s go after a `contains` statement:

```{include=examples/0x_basic_function.f90 .numberLines .Fortran startLine=1 endLine=9}
```

- use function like `y = function(x)`
- use `()` even if a function requires no arguments: `x = function()`
- As long as `implicit none` is in your `program` (or `module`, see
  later), not necessary in procedures
    - Some people may advise as good practice though

## Subroutines

- Essentially functions that don't need to return anything
- Can still return things via out-arguments
    - Could be multiple out-arguments
    - Not always a good idea!
- syntax:

```Fortran
subroutine <name>(<input>, <output>)
  implicit none
  <type>, intent(in) :: <input>
  <type>, intent(out) :: <output>
  ! body
end subroutine <name>
```

- Subroutines are used via the `call` statement:

```Fortran
call <name>(<arguments>)
```

## Subroutine example

```{include=examples/0x_basic_subroutine.f90 .numberLines .Fortran
startFrom=10 startLine=10 endLine=14}
```

used like:

```{include=examples/0x_basic_subroutine.f90 .numberLines .Fortran
startFrom=5 startLine=5 endLine=7}
```


## Recursion

- Due to historical reasons, procedures are not recursive by default:
  they cannot call themselves directly or indirectly
- Need to use `result` keyword to change name of function result
- Use `recursive` keyword:

```Fortran
recursive function factorial(n) result(res)
  ...
end function factorial
```

## Local variables

- Variables declared inside procedures are _local_ to that routine
    - Also called _automatic_ variables
- Their _scope_ is the immediate procedure
- Cannot be accessed outside the routine, except via:
    - function result
    - `intent(out)` or `intent(inout)` dummy arguments (see later)
- Local `allocatable` variables are automatically `deallocate`d on
  exit from a procedure
    - not the case for dummy arguments (see later), or variables
      accessed from a different scope (also see later!)

## Local variables

```{include=examples/0x_local_variables.f90 .numberLines .Fortran
startLine=3 endLine=12 startFrom=3}
```

`x` in the main program and `x` within `add_square` are different
variables


## More on scope

- Possible for procedures to access variables in the containing scope
    - Technically called _host association_
- Generally not a great idea!

```{include=examples/0x_global_variables.f90 .numberLines .Fortran
startLine=4 endLine=11}
```

- This is surprising, despite the `intent(in)`!
- Also hard to see where `x` comes from
- There are uses for this, but prefer to explicitly pass in variables
  via arguments

## Initialising local variables

- A word of warning when initialising local variables
- Giving a variable a value on the same line it is declared gives it
  an implicit `save` attribute
- This `save`s the value of the variable between function calls
- Initialisation is then _not done_ on subsequent calls:

```{include=examples/0x_save_attribute.f90 .numberLines .Fortran
startLine=13 endLine=17 startFrom=13}
```

## `intent`

- when writing programs, can be very useful to tell the compiler as
  much information as you can
- one useful piece of info is the _intent_ of arguments to procedures
- this can help avoid certain classes of bugs
- there are three `intent`s:
- `intent(in)`: this is for arguments which should not be modified in
  the routine, only provide information _to_ the procedure
- `intent(out)`: for arguments which are the _result_ of the
  routine. these are _undefined_ on entry to the routine: don't try to
  read them!
- `intent(inout)`: for arguments are to be modified by the procedure
    - if you don't explicitly provide an `intent`, this is the default
- these are essentially equivalent to read-only, write-only and
  read-write
- prefer `function`s over `subroutine`s with `intent(out)` arguments
    - easier to read!

## dummy arguments

- _dummy_ arguments are the _local_ names of the procedure arguments
- _actual_ arguments are the names at the calling site
    - _actual_ arguments are said to be _associated_ with the _dummy_
      arguments
- the routine doesn't care or know what the names of the actual
  arguments are
    - type, kind, rank and order have to match though!

## dummy arguments

```{include=examples/0x_dummy_arguments.f90 .numberLines .Fortran}
```

- `x` becomes associated with `a`; `y` with `b`; `z` with `c`


## Keyword arguments

- Another nifty feature of Fortran is keyword arguments:

```{include=examples/0x_keyword_arguments.f90 .numberLines .Fortran
startFrom=6 startLine=6 endLine=8}
```
- lets us change the order of the arguments
- _very_ useful as documentation at the calling site!
    - especially when lots of arguments (but don't)
    - or multiple arguments with same type next to each other

```Fortran
call calculate_position(0.345, 0.5346)
! or
call calculate_position(radius=0.345, angle=0.5346)
```

## dummy arguments and arrays

Three choices for passing arrays:

- `dimension(n, m, p)`: explicit size
    - Need to pass `n`, `m`, `p` as well (or get them from elsewhere)
    - Actual argument has to be exactly this size
    - Compiler can only check size is correct if it knows the size at
      compile time
- `dimension(n, m, *)`: _assumed size_ -- old, don't use!
    - Compiler doesn't know the size of the array, so you better index
      it correctly!
- `dimension(:, :, :)`: _assumed shape_
    - Compiler now _does_ know the size of the actual array passed
    - Can check if you go out-of-bounds (may need compiler flag!)
    - Indices now always start at 1
- `dimension(n:, m:, p:)`: assumed shape with lower bounds
    - Compiler still knows the correct size
    - but remaps indices to match your provided lower bounds
    - `n`, `m`, `p` need to be passed in (or got from elsewhere)

## Pure procedures

### FIXME

## Elemental procedures

- We saw some intrinsics can handle scalars or arrays
- It is also possible to write our own functions that can operate on
  both scalars and arrays
- These functions apply the function to each element, so they are
  called _elemental_

```{include=examples/elemental_functions.f90 .numberLines .Fortran
startFrom=4 startLine=4 endLine=11}
```


### FIXME


# Session 5

## Overview

- More control flow
- Input and output

## `select case`

- When comparing series of mutually exclusive values, order is not
  important
- `case` construct can be useful

```Fortran
select case (x)
case (1)
  print*, "x is 1"
case (2:4)
  print*, "x is between 2 and 4"
case default
  print*, "x is neither 1 nor between 2 and 4"
end select
```

## `select case`

- The expression in the `select case` must be an `integer`, `logical`
  or `character` scalar variable
- Ranges must be of same type
    - `:upper_bound`
    - `lower_bound:`
    - `lower:upper`
    - `value`

### FIXME

example

## `select case`

- Neat thing about `select case` in Fortran: works with strings!

```Fortran
character(len=:) :: animal

select case (animal)
case ("cat")
    print*, "meow!"
case ("dog")
    print*, "woof!"
case ("pig")
    print*, "oink!"
case default
    print*, "<generic animal noise>"
end select
```

- Can be useful for parsing user arguments
    - careful not to overdo it though, this is expensive!

### FIXME

example

## `cycle`

- skip to next loop iteration

```Fortran
integer :: i
do i = 1, 5
  if (i == 3) cycle
  print*, i
end do
```

### FIXME

example

## Loop labels

- Many constructs in Fortran can be given labels
- Useful as a form of documentation: what does this loop _do_?
- Also useful when you need to jump out of a nested loop:

```Fortran
integer :: i, j
outer: do i = 1, 5
  inner: do j = 1, 5
    if ((i + j) == 9) exit outer
    print*, i, j
  end do inner
end do outer
```

### FIXME

example

## Formatted i/o

- What does the `*` mean in `print`, `read`?
- Why is it `print` and `read`?
- Why does Fortran put great big spaces between variables in `print`?

## Formatted i/o

- `print*,` is essentially short for `write(*, *)`
- `read*,` is essentially short for `read(*, *)`
- Note lack of trailing commas!
- One step closer
- `write(*, *)` is short for `write(unit=*, fmt=*)`
- A bit closer!

## What do those stars mean

- first argument, `unit`, tells program _where_ to `read`/`write`
    - `*` means `stdout` -- _standard out_ for `write`
        - usually "screen", but could be redirected somewhere else
    - `*` means `stdin` -- _standard in_ for `read`
        - usually keyboard, but could be something else redirected
    - Similar to file descriptor/handle in other languages
- second argument, `fmt`, short for _format_, tells program _how_ to
  `read`/`write`
    - `*` means "read/write everything, separated by spaces"
        - Also called _list-directed I/O_

## Formatted I/O

- Formats first
- Instead of star, can give a _format string_
    - (technically _data edit descriptor_, but yeesh)
- Basic form is `'(<something>)'`, where `<something>` is a
  comma-separated list of format codes
- `write(*, '(a, i0, a)') "I have ", number_of_cats, " cats"`
    - `a` means `character`
    - `i0` means `integer`, the `0` is "make it as wide as it needs to
      be"
- Can also stick text in there:
- `write(*, '("I have ", i0, " cats")') number_of_cats`

## Formatted I/O

### Basic format codes

- `a`: `character`
- `i`: `integer`
- `f`: `real`
- `e`: `real`, but using scientific notation

### Widths

- `cw.d`:
    - `c`: code (e.g. `i`, `f`, `e`)
    - `w`: width of whole field
    - `d`: number of digits after decimal place for `real`, minimum
      number of digits (pad with leading zeros) for `integer`

## Formatted I/O

```{include=examples/format_string.f90 .numberLines .Fortran
startFrom=12 startLine=12 endLine=18}
```
```{include=examples/format_string.f90 .numberLines .Fortran
startFrom=24 startLine=24 endLine=28}
```


## Formatted I/O

- can repeat chunks:

```{include=examples/repeating_format_string.f90 .numberLines .Fortran
startFrom=8 startLine=8 endLine=8}
```
- This means:
    - three lots of square brackets surrounding:
    - three lots of `integer` separated by commas

### FIXME

- the i/o control statement will consume stuff from _transfer list_ to
  fill up the format string
- `write` writes a newline every time it "fills up" the format string
- `read` similar, but ignores everything until after next newline
- Compiler will check types, but unfortunately only at runtime
- this is because format string can be built dynamically!
- `****` when format is too small for data
- nice tip: can put format string into a `character`

## unformatted i/o

### FIXME

- good for checkpoints, etc.
- _much_ faster than writing text
- _can_ be read by other programs, but technically not portable
    - i.e. don't rely on it!
- for serious HPC programs, better to use a library such as NetCDF

## `open` - File I/O

- Open a file called `<filename>` for reading/writing:

```Fortran
open(newunit=<unit>, file=<filename>)
```

- Now we can't just use `*` for the unit, as we need a "handle" to
  give to `read`/`write`
- `unit_num` is integer (that you've already declared)
- `newunit` will make sure it's unique (and negative)
- `newunit` is F2008. Older versions:

```Fortran
open(unit=10, file="rectangle.shape")
```

- You probably want to make the unit a `parameter` with a value `> 10`
  (to avoid clashing with pre-declared units)

## `open` arguments

Lots of possible arguments, but two useful ones:

### `status`
- Can be one of the following:
- `"old"`: must already exist
- `"new"`: must not exist
- `"replace"`: overwrite any existing file
- `"scratch"`: remove file after `close` or end of program
- `"unknown"`: you don't care!

### `action`
- Can be one of the following:
- `"read"`: `open` the file for `read` only
- `"write"`: `open` the file for `write` only
- `"readwrite"`: allow both `read` and `write`

## `read`

- Once you've got a file with a `unit`, you can read from it into
  variables

```Fortran
read(unit=<unit>, fmt=<fmt>) <transfer list>
```

- `<unit>` must be already `open`ed unit
- `unit=*`, `fmt=*` is same as `read(*,*)`
- The `intrinsic` module `iso_fortran_env` has `input_unit` for
  `stdin`

## `write`

- Similarly, once you've got a file with a `unit`, you can write into
  it from variables or expressions

```Fortran
write(unit=<unit>, fmt=<fmt>) <transfer list>
```

- `<unit>` must be already `open`ed unit
- `unit=*`, `fmt=*` is same as `write(*,*)`
- The `intrinsic` module `iso_fortran_env` has `output_unit` for `stdout`

## `close`

- Need to `close` files after we're done to ensure contents get
  written to disk properly

```Fortran
close(unit=<unit>)
```

- `<unit>` must be already `open`ed unit

## `iostat`

- All the file I/O commands can take an `iostat` argument
- Should be integer you've already declared
- Error if `iostat /= 0`
- Best practice is to check value of `iostat`

```Fortran
integer :: istat
open(newunit=unit_num, file="filename", iostat=istat)
if (istat /= 0) error stop "Error opening file"
```

- Worst practice is to use `iostat` and not check it!

## `iomsg`

- Any I/O operation errors will cause abort unless `iostat` is used
- `iostat == 0` means success -- any other value is compiler dependent
- Use `iomsg` to get a nice human readable message!
- Unfortunately, no spec on how long it should be

```Fortran
integer :: istat
character(len=200) :: error_msg
open(newunit=unit_num, file="filename", iostat=istat &
     iomsg=error_msg)
if (istat /= 0) then
  print*, error_msg
  error stop
end if
```

## Working with files example

```{include=examples/open_and_read_file.f90 .numberLines .Fortran
startFrom=10 startLine=10 endLine=23}
```

### FIXME

`write` example


## Namelists

- Another nifty feature of Fortran
- Great for simple things, not so great for more complicated things
- Similar to list/record-based I/O above: give a list of variables to
  read from/write to file
- But now with reading, have a bit more flexibility

```Fortran
namelist /<name>/ <variable1> {, <variable2> ...}

read(<unit>, nml=<name>)
```

and the input file looks like:

```
&<name>
  <variable1> = <value1>
  <variable2> = <value2>
/
```

## Namelists

- Can also write namelists
    - useful for recording what inputs were actually used
- variables can be in any order
- can even miss variables! useful for default values
- extra ones not in the `namelist` statement is an error though
- Also, `logical`s can be `T`/`F`, `.true.`/`.false.`, `1`/`0`
- Variables need to be declared first
- Comments are allowed (and are ignored), case insensitive (as usual),
  and whitespace is mostly ignored (except within names, as usual)
- Unfortunately, `namelist`s are not quite first-class entities
    - Meaning you cannot put them in a variable of any kind, pass them
      to a function, etc.
    - This becomes a pain if you want to do more complicated things,
      e.g. have multiple ion species, each with identical namelists

### FIXME

- double check logicals
- example
- practical

# Session 7

## Overview

- Modules
- Derived types
- Characters
- Interfaces

## Modules

- very big programs become difficult to develop and maintain
- becomes useful to split up into separate files
- early versions of Fortran just stuck subprograms into separate files
  and compiled them altogether
    - still works!
    - but don't do it!
- but compiler doesn't know what procedures are in what files, or what
  the interfaces look like (number and type of arguments)
- solution is `module`s
- compiler generates interfaces for you
- _always_ use `module`s when using multiple files
- `module`s can also contain variables as well as procedures
    - try to avoid though, except for `parameter`s
- can choose what entities in a `module` to make `public` or `private`
    - `module` is a bit like a single instance of an object

### FIXME

- tidy


## Modules

- Syntax looks very similar to `program`:

```Fortran
module <name>
  implicit none

  ! variables, types, parameters

contains

  ! functions, subroutines

end module <name>
```

- Just like `program`s, `implicit none` applies to the whole `module`

## Modules

- But note that `module` body before `contains` cannot include
  executable statements!

  ```Fortran
  module badbad
    implicit none
    print*, "this won't compile!"
  end module badbad
  ```

## Using modules

Using a `module` is simple:

```Fortran
program track_particles
  use particle_properties
  implicit none
```

or even better, just certain things (could be either variables or
procedures):

```Fortran
subroutine push_particle
  use particle_properties, only : electron_mass, electron_charge
```

This is great!
    - more obvious where `electron_mass` comes from
    - doesn't bring in extra names
    - can even rename things

```Fortran
subroutine push_particle
  use particle_properties, only : electron_mass => mass
```
- Note: `use` statements must come before `implicit none`

## Using modules

- Plain `use <module>` brings in _everything_ from `<module>` to the
  local scope
    - This is called _use association_
- Sometimes we want to have some variable or procedure that is used
  "internally" to a module, and don't want to be able to access it
  from outside that module
- We can use `public` and `private` statements and attributes to
  control which names are available to be `use`d
- `private` entities (i.e. variables or functions) won't be visible
  outside the module
- `private`/`public` statement by itself marks the default visibility
- Then can add either as an attribute to individual entities
- Entities `use`d from other modules can also have visibility
  attributes applies to them

## Module visibility

```Fortran
module particle_properties
  !
  use physics_constants, only : speed_of_light
  implicit none
  private  ! Marks all entities as private by default

  ! As attribute on variable declaration
  real, parameter, public :: electron_mass = 9.1e-31

  ! As separate attribute for procedure
  public :: kinetic_energy

contains
  ! Given public attribute above, so can be used outside of module
  function kinetic_energy(mass, velocity)
  ...

  ! Takes default private attribute, so cannot be used outside of module
  function is_relativistic(velocity)
  ...
```

### FIXME

- make proper example
- think of reason to have something private!

## Modules

- Compiling a `module` results in a `.mod` file as well as the built
  object
- This is essentially an interface file, and is similar (though very
  different!) to a C header file
- Slightly unfortunately, `.mod` files are not portable even between
  versions of the same compiler!
    - This is "Application Binary Interface" (ABI) and is a Hard
      Problem

## Compiling modules

- Getting an executable that you can run is (essentially) two step
  process:
    - _Compile_ source code to _object files_
    - _Link_ object files to _executable_
- Compiler normally takes care of both compiling and linking for us
- If we tell the compiler about all the files we want to compile and
  link together in one go, we don't need to do anything special
- Modules are not executable, so if we don't want to compile
  everything at once, need to tell compiler to stop at the object file
  stage
- For `gfortran`, this is the `-c` flag:

```bash
# Creates my_module.o
$ gfortran -c my_module.f90
# Compiles my_program and links it with my_module
$ gfortran my_module.o my_program.f90 -o my_program
```

## Modules in practice

- Cannot have circular dependencies
    - A uses B which uses A
    - This won't work!
    - Ways round it (may cover `submodule`s later)

- Some trickiness: there is now an order in which you have to compile
  files
- If A uses B which uses C, need to compile C then B then A
- Can do it manually, but quickly gets out of hand
- Some compilers can sort this out (but need two passes)
- There are tools available,
  e.g. [fortdepend](https://github.com/ZedThree/fort_depend.py)
- Also build systems such as [CMake](https://cmake.org) can take care
  of this for you

### FIXME

- Full module example
- Project layout


## Derived types

- Not uncommon to need to call a set of functions with the same
  few arguments
- Or we may have some variables that we need to keep in sync
- One solution to these problems is a _derived type_
    - Other languages call these _structs_ or _classes_
- A derived type contains _components_ (or _members_) which can be
  intrinsic types or other derived types
- Fortran does have the ability to do some _object-oriented
  programming_
    - Will only cover a little bit here

### FIXME

## Derived types -- basic syntax

```Fortran
type :: <name>
    <type> :: <component name>
    ...
end type <name>
```

Use like

```Fortran
type(<name>) :: <variable name>
```

## Derived types -- example

```Fortran
type :: particle
  real(real64) :: mass
  real(real64) :: charge
  character(len=:), allocatable :: name
end type
```

### FIXME

particle with mass, charge, energy

## type-bound procedures

- Can associate a procedure with a type
    - But procedure can remain as a _free function_
- Called _methods_ in other languages
- Slightly annoying in that definition still needs to be in the
  `contains` section of the `program` or `module`

### FIXME

- example

## Private/Public

- Just like `module`s can have declare the visibility of their
  entities, `type`s can specify visibility of their members
- This is very useful if there's some member that needs to be kept in
  sync with the state of the type
    - e.g. a particle might store its energy, instead of recalculating
      it every time
    - Or a container might store how many items it holds
- These are called _invariants_
- Can make the invariant `private` and then provide `public` methods
  to get or set the value

### FIXME

- example

## Optional arguments

- Common to have a function that only sometimes needs a particular
  argument
- Can make these arguments `optional`
- We've met a few intrinsics with optional arguments
- Need to check that an `optional` argument is `present` before we can
  use it
    - Except to pass it to other functions
- Require a bit of special handling if we want to give `optional`
  arguments default values

## Optional arguments

```{include=examples/optional_arguments.f90 .numberLines .Fortran
startFrom=8 startLine=8 endLine=23}
```

## Optional arguments

```{include=examples/optional_arguments.f90 .numberLines .Fortran
startFrom=4 startLine=4 endLine=5}
```

Also notice that we need to check if `politely` is `present` before
trying to use it at all:


```{include=examples/optional_arguments.f90 .numberLines .Fortran
startFrom=16 startLine=16 endLine=17}
```

The following is dangerous, because standard doesn't mandate short-circuiting:
```Fortran
if (present(politely) .and. politely) then
...
```


## `block`

- Fortran requires all variables to be declared at the top of the
  scope, before first executable statement
    - Limitation of early compilers!
- But modern best practice is to declare variables only where you need
  them
- Reducing scope -> always good!
    - Easier to read
    - Reduces chances for bugs
- `block` construct allows introduction of new entities
- Names within a `block` can _shadow_ or hide those outside

## `block` example

```{include=examples/0x_block_demo.f90 .numberLines .Fortran
startFrom=3 startLine=3 endLine=11}
```

## `stop` and `error stop`

- Sometimes want to finish a program "early"
    - Maybe some quantity has converged
    - Maybe something's gone wrong and we can't continue
- Two statements: `stop` and `error stop`
    - Essentially equivalent, except `error stop` always indicates an
      error somehow
- Can take an `integer` or `character` constant (i.e. value has to be
  known exactly at compile time)
    - Relaxed in Fortran 2018!

```Fortran
character(len=*), parameter :: converged = "The simulation has converged!"
...
stop converged
```

- Unfortunately, the standard is vague on what happens with an integer
- _Usually_ is the exit code, if between 0--127
    - Can't 100% rely on this, but mostly fine

## Other useful intrinsics

### FIXME

- `call execute_command_line`
- `call cpu_time`
- `call get_command_line`

## Working with `character`s

- `character`s of a fixed length are terminated by _blanks_,
  i.e. spaces
- so `character(len=10) :: cat = "ziggy     "`
- `character`s can be indexed similarly to arrays, with one
  restriction: the colon (`:`) is **required**:

```Fortran
character(len=10) :: cat = "Ziggy     "
cat(:3) == "Zig"
cat(4:4) == "g"
cat(5:) == "y     "
```

## Working with `character`s

- We can stick two `character`s together with the _concatenation
  operator_, `//`:

```Fortran
character(len=*), parameter :: cat1 = "Ziggy", cat2 = "Lana"
character(len=*), parameter :: both_cats = cat1 // " and " // cat2
```

- This is the easiest way to build up a string dynamically
- But we can also `write` to a `character`!
- Just use the variable in place of the `unit` argument

## Writing to a `character`

```{include=examples/write_to_character.f90 .numberLines .Fortran
startFrom=4 startLine=4 endLine=14}
```

## Useful intrinsics for `character`s

- `len(string)`: How long is `string`, including the trailing spaces
- `len_trim(string)`: How long is `string`, _excluding_ the trailing
  spaces
- `trim`: Remove all trailing spaces
- `adjustl(string)`, `adjustr(string)`: "Adjust" the string
  left/right, moving leading/trailing spaces to the end/beginning
- `index(string, substring)`: Return the starting position of
  `substring` within `string`, or zero if it's not found.
- `new_line(a)`: Get the new line `character` of the same kind as `a`
    - This is the equivalent of `\n` in C, Python, etc.

## Interfaces

- Early Fortran standards didn't have `contains` or `module`s
- Functions could be external to the program, e.g. in a library
- Return type for functions was `implicit`, i.e. based on first letter
  of name
- Type and number of arguments was completely unknown to the compiler
    - Programmer had better get them right!
- Very bug prone!

## Missing interface example

External library:
```{include=examples/idouble.f90 .numberLines .Fortran}
```
Program:
```{include=examples/external_function.f90 .numberLines .Fortran}
```

## Interfaces

- Fortran 90 introduced `contains`, `module`s and `interface`s
- Interface is essentially the procedure minus the executable
  statements
- Procedures in `module`s and `program`s have _interfaces_ generated
  by the compiler
    - Also known as _signatures_ or _prototypes_
- The interface allows the compiler to give warnings/errors if
  arguments are wrong
- Programmers could also write an explicit `interface` block for
  external procedures themselves
    - Useful for legacy libraries or interoperability with other languages

## Interfaces

```{include=examples/external_function_with_interface.f90 .numberLines
.Fortran
startFrom=3 startLine=3 endLine=14}
```

Now compiler knows that `idouble(2.0)` and `iadd(2, 4)` are mistakes!

## Passing procedures

- With an interface, we can now pass procedures to other procedures
- Useful for writing e.g. integration routines

Let's take two functions we want to apply:

```{include=examples/passing_procedure.f90 .numberLines .Fortran
startFrom=18 startLine=18 endLine=26}
```

## Passing procedures

Using an explicit interface in the function:

```{include=examples/passing_procedure.f90 .numberLines .Fortran
startFrom=28 startLine=28 endLine=37}
```

And calling the function:

```{include=examples/passing_procedure.f90 .numberLines .Fortran
startFrom=10 startLine=10 endLine=11}
```


## Passing procedures

- This gets very verbose if we use the same function interface a lot
- Another option is to use an _abstract interface_ to name a signature

```{include=examples/passing_procedure.f90 .numberLines .Fortran
startFrom=4 startLine=4 endLine=8}
```

- We can then declare our dummy argument to be a `procedure` of this type:

```{include=examples/passing_procedure.f90 .numberLines .Fortran
startFrom=39 startLine=39 endLine=44}
```


## Generic interfaces

- Very common to want to have the same function for multiple types, or
  different sets of arguments
    - Called _overloads_ in other languages, but not quite the same in
      Fortran
- Before Fortran 90, needed to have a different name for each function
    - e.g. `idouble` for `double` function on `integer`s, `cdouble`
      for `complex`
- Only intrinsics could have generic names
- `interface` allows us to "group" functions or subroutines together
  under a common name
    - Cannot group _both_ `function`s and `subroutine`s together
      though!
- Somewhat annoyingly, can only do this for external procedures or
  those in `module`s, _not_ those in `program`s

## Generic interfaces

- For external procedures, need to write out explicit interfaces
- Don't need to repeat interface for modules, can just say

```Fortran
interface <generic-name>
  module procedure <specific-name-1>
  module procedure <specific-name-2>
end interface <generic-name>
```

- Can use this to define new _constructors_ for derived types, or even
  operators:

```Fortran
interface operator(+)
  module procedure add_my_type
end interface
```

## Generic interfaces

In a module:
```{include=examples/generic_interface.f90 .numberLines .Fortran
startFrom=1 startLine=1 endLine=7}
```
Using it in a program:
```{include=examples/generic_interface.f90 .numberLines .Fortran
startFrom=25 startLine=25 endLine=30}
```

## Generic interfaces

- There are some rules about what can be put in a generic interface
- Mostly, the dummy arguments must be _distinguishable_:
- Different number of arguments
- Different types
- Different kinds
- Different ranks
- `allocatable`/`pointer`
- Procedure vs variable

### FIXME

- Check if names matter

## Bad old stuff

### FIXME

- `common` blocks
- `goto`
- `do; do; 10 continue`

## Documentation

- Documentation is a vital but dull part of programming
- Everybody hates trying to use undocumented code
    - Even worse trying to modify someone else's!
- Comments can be used to document the code inline
- Good practice to put a comment above procedures to explain what it
  does and **how**
- Comments on tricky bits of code to explain **why**
- Various tools, e.g. Ford:
  <https://github.com/Fortran-FOSS-Programmers/ford>
- Usually special comment syntax for bits you want Ford to recognise,
  e.g. `!!`

## Ford documentation example

```Fortran
!! Feeds your cats and dogs, if enough food is available. If not enough
!! food is available, some of your pets will get angry.
subroutine feed_pets(cats, dogs, food, angry)
    !! The number of cats to keep track of.
    integer, intent(in)  :: cats
    !! The number of dogs to keep track of.
    integer, intent(in)  :: dogs
    !! The ammount of pet food (in kilograms) which you have on hand.
    real, intent(inout)  :: food
    !! The number of pets angry because they weren't fed.
    integer, intent(out) :: angry
    ...
end subroutine feed_pets
```

## Further reading

- "Modern Fortran explained", Metcalf, Reid, Cohen
- Fortran wiki

## intrinsic modules

### FIXME
