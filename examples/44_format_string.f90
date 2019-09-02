program format_string
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none
  real(real64), parameter :: pi = 4._real64*atan(1._real64)
  integer :: i
  integer, parameter :: grid_size = 8
  real(real64), dimension(8), parameter :: grid = &
       [((i * 2. * pi / grid_size), i = 1, grid_size)]
  real(real64), dimension(8) :: array = sin(grid)


  print*, "integer formats:"
  write(*, '("      |12345678|")')
  write(*, '("i0:   |", i0, "|")') grid_size
  write(*, '("i4:   |", i4, "|")') grid_size
  write(*, '("i4.4: |", i4. 4,"|")') grid_size
  write(*, '("i0:   |", i0, "|")') 23249425
  write(*, '("i4:   |", i4, "|")') 23249425

  print*
  print*, "------------------------------"

  print*, "real formats:"
  write(*, '("        |000000000111111111|")')
  write(*, '("        |123456789012345678|")')
  write(*, '("f3.1:   |", f3.1, "|")') 2. * pi
  write(*, '("f8.4:   |", f8.4, "|")') 2. * pi
  write(*, '("f2.1:   |", f2.1, "|")') 2. * pi
  write(*, '("f18.10: |", f18.10, "|")') pi*100
  write(*, '("e18.10: |", e18.10, "|")') pi*100
  write(*, '("g18.10: |", g18.10, "|")') pi*100
  write(*, '("f18.4:  |", f18.4, "|")') pi*1e9
  write(*, '("e18.4:  |", e18.4, "|")') pi*1e9
  write(*, '("g18.4:  |", g18.4, "|")') pi*1e9

  print*, "------------------------------"
  print*, "write two arrays without a format:"
  write(*, *) grid, array

  print*, "------------------------------"
  print*, "write two arrays with a format:"
  write(*, '(8(f8.4))') grid, array

end program format_string
