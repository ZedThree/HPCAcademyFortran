# Session 1

## What is Fortran?

- old language! 1957 -- 62 years old
    - many versions over the years, latest is 2018! And next one is
      being worked on as we speak
- some parts feel outdated
- but still in use for good reason!
- can be _very_ fast
- native multidimensional arrays
    - very useful for scientists!
- compiled language
- statically typed:
    - types of variables must be specified at compile time and cannot
      be changed
- imperative: commands executed in order


## Hello world

```Fortran
program hello_world
  implicit none
  
  ! Program prints "Hello, world" to the screen
  print*, "Hello, world"
end program hello_world
```

1. All programs must start with `program` and a label and end with
   `end program <label>`
2. `implicit none`
3. A comment
4. Write to screen

## Compiling code

`gfortran source.f90` -> `a.out`
`gfortran source.f90 -o executable` -> `executable`

## Types

- `integer`
- `real`
- `logical`
- `character`
- `complex`

(later, we will look at derived types)

## Variables

Always, always `implicit none`

syntax: `type :: variable_name`

- note: `::` not always needed, but never hurts!
- note: names must start with a letter, and are limited to ASCII
  lower/uppercase, numbers and underscore
- pick variable names wisely!
    - in F2003, you can have up to 63 characters in a name

can initialise in the declaration, but WARNING

## Operations

### arithmetic

`**` for exponentiation
`()` for clarity!

BODMAS and left-to-right, but use `()` to clarify

### logical/boolean

Prefer `<` over `.lt.`

`/=`, `.ne.` is not equals (part of reason why `a *= b` doesn't exist!)

## Intrinsic functions

- built-in to language
- Lots of maths!
- use them if they exist -- can be heavily optimised by compiler

## Control flow


```Fortran
if (logical-expression) then
  ! do something
end if
```
