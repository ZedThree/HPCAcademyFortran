program parameters
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none
  integer, parameter :: wp = real64
  real(kind=wp), parameter :: pi = 4._wp*atan(1._wp)
  integer, parameter :: grid_size = 4
  integer, dimension(grid_size), parameter :: x_grid = [1, 2, 3, 4]

  print*, pi
  print*, x_grid
end program parameters
