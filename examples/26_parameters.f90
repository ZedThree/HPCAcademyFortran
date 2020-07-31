program parameters
  implicit none
  real, parameter :: pi = 4.*atan(1.)
  integer, parameter :: grid_size = 4
  real, dimension(grid_size), parameter :: x_grid = [0., .25, .5, .75]
  real, dimension(grid_size), parameter :: x = sin(2 * pi * x_grid)

  print*, x
end program parameters
