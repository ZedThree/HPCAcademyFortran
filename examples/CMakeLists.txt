cmake_minimum_required(VERSION 3.12)

project(FortranExamples VERSION 0.1
  DESCRIPTION "Examples for HPC Academy"
  LANGUAGES Fortran)

add_executable(01_hello_world
  01_hello_world.f90)
target_compile_options(01_hello_world PRIVATE -Wall -Wextra)

add_executable(02_hello_input
  02_hello_input.f90)
target_compile_options(02_hello_input PRIVATE -Wall -Wextra)

add_executable(03_basic_maths
  03_basic_maths.f90)
target_compile_options(03_basic_maths PRIVATE -Wall -Wextra)

add_executable(04_logical_operators
  04_logical_operators.f90)
target_compile_options(04_logical_operators PRIVATE -Wall -Wextra)
