---
title: Introduction to Fortran
author: Peter Hill
classoption: aspectratio=169
theme: York169dark
highlight-style: my.theme
---
# Session 1

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
- compiled language
    - c.f. Python as interpreted language
- statically typed:
    - types of variables must be specified at compile time and cannot
      be changed
    - "strong" typing, c.f. C
- imperative: commands executed in order
    - c.f. SQL

### Alternatives

- C++
    - Templates make it possible to express generic operations
    - Can get "close to the metal", can get very good performance
    - Multidimensional array support poor (no native support,
      libraries exist)
- Python
    - Easier to use!
    - Possible cost of performance (but e.g. numpy uses C or Fortran
      under the hood!)
- Matlab
    - Expensive!

## Fundamentals of Programming

- Source code is read more times than it is written, by factor 5 or
  more
- We use high-level languages in order to be understandable to humans
- Therefore, more important to write _readable_ code than _efficient_
  code
    - Even more important that it is correct


## Hello world

```{include=examples/01_hello_world.f90 .numberLines .Fortran}
```

- Lines 1 & 5: All programs must start with `program <label>` and end
  with `end program <label>`
- Line 2: `implicit none`: Historical reasons! Old Fortran had implicit
  typing: more on this later
- Line 3: A comment, begins with `!`
- Line 4: Print some text to screen

## Compiling code

This will be covered more in depth later on

Basic compilation is as so:

- `gfortran source.f90` -> `a.out`
- `gfortran source.f90 -o executable` -> `executable`

And running like

- `./executable`

## Types

There are 5 fundamental types in Fortran:

- `integer`
- `real` -- floating point numbers
- `logical` -- booleans, true/false
- `character` -- text, also called strings
- `complex` -- floating point complex numbers

(later, we will look at derived types)

## What, exactly, is a type?

- Computers store _everything_ in binary, ones and zeros, called _bits_
- Given a set of bits, what does it mean?
    - Could be a number, could be some text
    - Could be an instruction!
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

## Cover literals here
- FIXME: later
- Writing `real`s:
```Fortran
2.
0.3
4.6E4
0.02e-3
```
- Note: `real` literals are single-precision by default
    - more on this later

## Variables

- A variable is label for some value in memory used in a program
- In Fortran, we must tell the compiler up front what type a variable
  is, and this is fixed
    - Other languages, like Python, we can change our minds
- Variables are declared like:

```Fortran
<type> :: <name>
```
- Note: `::` not always needed, but never hurts!
- Note: names must start with a letter, and are limited to ASCII
  lower/uppercase, numbers and underscore
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

## Hello world again

```{include=examples/02_hello_input.f90 .numberLines .Fortran}
```

- Line 3: `character(len=20)`: we need to say up-front how long how strings
  are via the `len` type parameter
- Line 6: `read*,`: read a variable from stdin/command line
- Line 9: `&`: line continuation for long lines

## What's this `implicit none`?

- Always, always `implicit none`
- Early Fortran done on punch cards
- Assume anything starting with `i-n` is an `integer`, otherwise it's
  `real`
- Very easy to make a tpyo and use an undefined value, get the wrong
  answer
- One `implicit none` at the top of the program (or module, see later)
  is sufficient
    - You may like to keep it in every function, see later

## Initialisation

- Can initialise in the declaration, but WARNING!
- This unfortunately adds extra semantics that you may not intend
    - Will cover when we get onto functions

## Arithmetic operations

- Usual mathematical operators: `+, -, *, /`
- Plus `**` for exponentiation
    - Careful you only use integers unless you mean it
- BODMAS/PEDMAS and left-to-right, but use `()` to clarify

```{include=examples/03_basic_maths.f90 .numberLines .Fortran}
```

### FIXME

- mixed-type operations
- integer division
- briefly, floating point maths

## Logical/boolean operations

- `<`, `<=`, `>`, `>=`, `==`, `/=`
    - Note the inequality operator! Might look odd if you come from
      C-like languages or Python
    - This operator is essentially why Fortran doesn't have short-hand
      operators like `a *= b`
- Also wordier versions:
    - `.lt.`, `.le.`, `.gt.`, `.ge.`, `.eq.`, `.ne.`

Prefer `<` over `.lt.`, etc.!

`/=`, `.ne.` is not equals (part of reason why `a *= b` doesn't
exist!)

```{include=examples/04_logical_operators.f90 .numberLines .Fortran}
```

## Intrinsic functions

- built-in to language
- Lots of maths!
    - `sin`, `cos`, etc.
    - F2008 has things like `hypot`, `bessel_j0`, `erf`, `norm2`
- use them if they exist -- can be heavily optimised by compiler
    - Difficult to detect if they are available of course

## Control flow


```Fortran
if (logical-expression) then
  ! do something
end if
```

or more generally:

```Fortran
if (logical-expression-1) then
  ! do something 1
else if (logical-expression-2) then
  ! do something 2
else
  ! do something 3
end if
```

- Bare `else` must be last
- conditions are checked from the top:

```Fortran
program positive_negative
  implicit none
  integer :: x = 5
  if (x >= 0) then
    print*, "x is positive"
  else if (x > 1) then
    print*, "can never be reached!"
  else
    print*, "x is negative"
  end if
end program positive_negative
```

`.and.` etc

- note difference between `.eq.` and `.eqv.`

```Fortran
program x_range
  implicit none
  integer :: x = 5
  if ((x >= 0) .and. (x < 10)) then
    print*, "x is between 0 and 10"
  else
    print*, "x not between 0 and 10"
  end if
end program x_range
```

## Loops

`do`

`do while`

# Session 2

## `parameter`

- fixed at compile time
    - has to be made of literals and other `parameter`s
    - FIXME: and intrinsics?
- names are great!
- attribute (now we definitely need `::`)

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
        - What number represents what `kind` is entirely up to the compiler

- Don't use those! Use these:

```Fortran
! Get the kind number that can give us 15 digits of precision and 300
orders of magntitude of range
integer, parameter :: dp = selected_real_kind(15, 300)
! Declare a variable with this kind
real(kind=dp) :: x
! Use a literal with this range
x = 1.0_dp
```

### `iso_fortran_env`
- Even better! F2008 feature, but use this and complain if stuck on a
  previous standard (upgrade compilers!)

```Fortran
use, intrinsic :: iso_fortran_env, only : real64
real(real64) :: x
```

## `open` - File I/O

- Open a file for reading/writing:

```Fortran
open(newunit=unit_num, file="filename")
```

- `unit_num` is integer (that you've already declared)
- compiler will make sure it's unique (and negative)
- `newunit` is F2008. Older versions:

```Fortran
open(unit=unit_num, file="rectangle.shape")
```

- `unit_num` must already have a value (choose >=10)

- Lots of other arguments:
- status
- action
- iostat

### Note on keyword arguments

## `read`

- Once you've got a file with a `unit`, you can read from it into
  variables

```Fortran
read(unit=unit_num, fmt=*) height, width
```

- `unit_num` must be already `open`ed file
- `unit=*`, `fmt=*` is same as `read(*,*)`

## `write`

- Once you've got a file with a `unit`, you can write into it from
  variables

```Fortran
write(unit=unit_num, fmt=*) height, width
```

- `unit_num` must be already `open`ed file
- `unit=*`, `fmt=*` is same as `write(*,*)`

## `close`

- Need to `close` files after we're done to ensure contents get
  written to disk properly

```Fortran
close(unit=unit_num)
```

- `unit_num` must be already `open`ed file

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

## `case`

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

- The expression in the `select case` must be an `integer`, `logical`
  or `character` scalar variable
- Ranges must be of same type

- `:upper_bound`
- `lower_bound:`
- `lower:upper`
- `value`

## `do`

- Very often need a fixed number of iterations

```Fortran
integer :: i
do i = 1, 10
  print*, i
end do
```

- Can change the step/stride:

```Fortran
integer :: i
do i = 10, 1, -2
  print*, i
end do
```

- general syntax:

```Fortran
do counter = start, stop[, step]
  ! loop body
end do
```

- `counter` must be integer, cannot be changed inside loop
- value of `counter` is undefined outside loop (except with `exit`) --
  don't rely on it!

## `cycle`

- skip to next loop iteration

```Fortran
integer :: i
do i = 1, 5
  if (i == 3) cycle
  print*, i
end do
```

## `exit`

- Leaves loop entirely

```Fortran
integer :: i
do i = 1, 5
  if (i == 3) exit
  print*, i
end do
```

### Loop labels

```Fortran
integer :: i, j
outer: do i = 1, 5
  inner: do j = 1, 5
    if ((i + j) == 9) exit outer
    print*, i, j
  end do inner
end do outer
```


# Session 3

## Arrays

- Vector in 3D space could be 1D array of 3 elements:

```Fortran
real(kind=dp), dimension(3) :: vector
vector = [1.0_dp, 2.0_dp, -4.0_dp]
```
- Fortran can natively handle multidimensional arrays:

```Fortran
real(kind=dp), dimension(3, 3) :: matrix
```

- `matrix` has 3x3 = 9 elements

- We can _index_ an array using an integer:

```Fortran
print*, vector(1)
print*, vector(2)
print*, vector(3)

do i = 1, 3
  print*, vector(1)
end do
```

- **Note:** By default, Fortran indices start at 1!
- Can change this:

```Fortran
integer, dimension(-1:1) :: array
```
- 1D array, 3 values with indices `-1, 0, 1`
- Note array bounds separated with `:`, dimensions (or _ranks_) with
  `,`

- Can index an entire dimension via a _slice_ with `:`:


```Fortran
real(kind=dp), dimension(3) :: vector
real(kind=dp), dimension(3, 3) :: matrix
vector = [1.0_dp, 2.0_dp, -4.0_dp]
matrix(1, :) = vector
matrix(2, :) = 2.0_dp * vector
matrix(3, :) = 3.0_dp * vector
```

- Note `vector(:)` is the same as `vector`

## Allocatable arrays

- If size of array not known until some time into the program
  execution, can use `allocatable` arrays to dynamically size them

```Fortran
! These two are equivalent:
real(kind=dp), dimension(:), allocatable :: array1
real(kind=dp), allocatable :: array2(:)
! 3D array:
real(kind=dp), dimension(:, :, :), allocatable :: array3
```

- The number of dimensions/rank must be known at compile time
- After declaration, we must use `allocate` before first use:

```Fortran
real(kind=dp), dimension(:, :), allocatable :: array
allocate(array(10, 5))
```

- `array` is now `allocated`, but _uninitialised_

- When finished with the array, we can `deallocate` it and free up the
  memory:

```Fortran
deallocate(array)
```

## Guarding `allocate`

- Possible to request more memory than available
- Good practice to always check `allocate` succeeds using `stat`
  argument **caveat**

  ```Fortran
  use, intrinsic :: iso_fortran_env, only : real64, int64
  integer(int64), parameter :: bignumber = huge(1) * 2
  real(real64), dimension(:), allocatable ::bigarray
  integer :: istat
  allocate(bigarray(bignumber), stat=istat)
  if (istat /= 0) error stop istat
  deallocate(bigarray, stat=istat)
  if (istat /= 0) error stop istat
  ```

  - FIXME: `errmsg`

## Procedures

- Break programs up into building blocks
- Reusable components
    - Repeat tasks multiple times
    - Use same task in multiple contexts
- Procedures:
    - Functions
    - Subroutines
- Modules
- Procedures are good:
    - easier to test
    - reuse
    - maintainability
    - abstraction
    - collaboration
- Encapsulation: hide internal details from other parts of the
  program. Program against the _interface_

### Functions
- Takes arguments and returns a single result (may be array)
- Always returns a value
- Intrinsic functions, e.g. `sin(x)`, `sqrt(x)`
- syntax:

```Fortran
function my_function(input)
  implicit none
  <type>, intent(in) :: input
  <type> :: my_function
  ! body
  my_function = ! result
end function
```

- example:

```Fortran
function kronecker_delta(i, j)
  implicit none
  integer, intent(in) :: i, j
  integer :: kronecker_delta
  if (i == j) then
    kronecker_delta = 1
  else
    kronecker_delta = 0
  end if
end function kronecker_delta
```

- Functions in `program`s go after a `contains` statement:

```Fortran
program lattice
  implicit none

  print*, kronecker_delta(1, 2)
  print*, kronecker_delta(2, 2)

contains
  function kronecker_delta
    ...
```

- use function like `y = function(x)`
- use `()` even if a function requires no arguments: `x = function()`


### Subroutines

- Essentially functions that don't need to return anything
- Can still return things via out-arguments
    - Could be multiple out-arguments
    - Not always a good idea!
- syntax:

```Fortran
subroutine my_subroutine(input, output)
  implicit none
  <type>, intent(in) :: input
  <type>, intent(out) :: output
  ! body
end subroutine my_subroutine
```

- Subroutines are used via the `call` statement:

```Fortran
call my_subroutine(argument)
```

## Recursion

- Due to historical reasons, procedures are not recursive by default:
  they cannot call themselves directly or indirectly
- Use `recursive` keyword:

```Fortran
recursive function factorial(n)
  ...
end function factorial
```

## Local variables

## intent

## dummy arguments

# session 4

## modules

## derived types

## private/public

## optional arguments

## formatted i/o

## good practice


# C++ course

## Session 1

- suggested reading
- history of C/C++
- pros/cons of C++
- computer basics
    - bits and bytes
    - integers and floats
    - how CPU works
- what is programming
- how to write a program
- hello world
    - compiling and running
    - + reading
- whitespace + variable names

## session 2

- maths operators
- literals
- types
- variables
- integer division/mixed type operations
- floating point maths
- intrinsics
- branching -- if/else
- relational operators
- logical operators
- shortcut evaluation
- scope

## session 3

- select case
- iteration
    - do/while
    - exit
    - cycle
- file handling

## session 4

- functions
    - void/non-void
    - recursive
    - pass-by-value, -ref
        - intent
    - default arguments (optional)
- const and static (parameter and save)
- enums
- arrays
    - multidimensional arrays
- pointers

## session 5
- heap and stack
- memory allocation
- i/o formatting

## session 6

- preprocessor
- larger projects

## session 7

- OOP
    - structs/classes
    - methods
    - accessors
    - const-ness
    - ctors
    - dtors
