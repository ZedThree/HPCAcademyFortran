cmake_minimum_required(VERSION 3.12)

project(FortranExamples VERSION 0.1
  DESCRIPTION "Examples for HPC Academy"
  LANGUAGES Fortran)

macro(add_example example_name)
  add_executable(${example_name}
    ${example_name}.f90)
  target_compile_options(${example_name}
    PRIVATE -Wall -Wextra -std=f2008)
endmacro()

add_example(01_hello_world)
add_example(02_hello_input)
add_example(03_basic_maths)
add_example(04_logical_operators)
add_example(05_if_statement)
add_example(06_logical_boolean_operations)
add_example(07_infinite_do)
add_example(08_do_exit)
add_example(09_do_while)
add_example(10_do_while_none)
add_example(11_do_counter)
add_example(12_do_stride)
add_example(13_do_negative_stride)

add_example(0x_memory_order)
add_example(0x_parameters)
add_example(0x_allocate_stat)
add_example(0x_basic_function)
add_example(0x_basic_subroutine)
