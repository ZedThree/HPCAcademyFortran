program array_constructors
  implicit none
  real, parameter :: pi = 2.0 * acos(0.0)
  integer :: i
  integer, dimension(3) :: array1 = [1, 2, 3]
  real, dimension(10) :: array2
  integer, dimension(3, 3) :: array3 = reshape(&
       [(i, i=1, 9)], shape(array3))

  array2 = [(2. * pi * (real(i - 1) / 10.), i=1, 10)]

  print*, array1
  print*, array2
  print*, array3
  print*, sin([1., 2., 3., 4.])
end program array_constructors
