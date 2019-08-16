program array_intrinsics
  implicit none
  real, parameter :: pi = 4.*atan(1.)
  integer :: i
  integer, parameter :: N = 8
  real, dimension(N) :: x = [(2.*pi * real(i)/N, i=1, N)]

  print*, x
  print*, sin(x)
  print*, cos(x)
  print*, abs(sin(x))
  print*, exp(-(x - pi)**2 / (pi / 4.))
end program array_intrinsics
