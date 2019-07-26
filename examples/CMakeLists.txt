cmake_minimum_required(VERSION 3.12)

project(FortranExamples VERSION 0.1
  DESCRIPTION "Examples for HPC Academy"
  LANGUAGES Fortran)

macro(add_example example_name)
  add_executable(${example_name}
    ${example_name}.f90)
  target_compile_options(${example_name}
    PRIVATE -Wall -Wextra)
endmacro()

add_example(01_hello_world)
add_example(02_hello_input)
add_example(03_basic_maths)
add_example(04_logical_operators)
add_example(05_if_statement)
add_example(06_logical_boolean_operations)
