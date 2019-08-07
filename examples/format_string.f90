program format_string
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none
  real(real64), parameter :: pi = 4._real64*atan(1._real64)
  integer :: i
  integer, parameter :: grid_size = 8
  real(real64), dimension(8), parameter :: grid = &
       [((i * 2. * pi / grid_size), i = 1, grid_size)]
  real(real64), dimension(8) :: array = sin(grid)


  write(*, '(i8)') grid_size
  write(*, '(i8.4)') grid_size

  write(*, '(f8.4)') pi
  write(*, '(f2.1)') pi
  print*, "------------------------------"
  write(*, '(f18.10)') pi*100
  write(*, '(e18.10)') pi*100
  write(*, '(es18.10)') pi*100
  write(*, '(en18.10)') pi*100
  write(*, '(g18.10)') pi*100
  print*, "------------------------------"
  write(*, '(f18.10)') pi*100
  write(*, '(e18.10e1)') pi*100
  write(*, '(es18.10e1)') pi*100
  write(*, '(en18.10e1)') pi*100
  write(*, '(g18.10e1)') pi*100
  print*, "------------------------------"
  write(*, '(f18.4)') pi
  write(*, '(e18.4)') pi
  write(*, '(g18.4)') pi
  print*, "---1---------------------------"
  write(*, '(f18.4)') pi*1e9
  write(*, '(e18.4)') pi*1e9
  write(*, '(g18.4)') pi*1e9

  print*, "------------------------------"
  print*, grid, array
  print*, "------------------------------"

  write(*, '(8(f8.4))') grid, array

  print*, "------------------------------"
  read(*, '(2(f4.1))') array

  write(*, '(8(f8.4))') grid, array
  
end program format_string
