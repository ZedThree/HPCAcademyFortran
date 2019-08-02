program basic_maths
  implicit none
  real :: x, y
  print*, 3 * 4
  print*, 12 / 4
  print*, 3.6e-1 + 3.6e0
  x = 42.
  y = 6.
  print*, x + 2. / 4. * y ** 2
  print*, x + ((2. / 4.) * (y ** 2))
end program basic_maths
