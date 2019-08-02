program intrinsic_functions
  implicit none
  real :: pi = 2.0 * acos(0.0)
  print*, sin(pi / 4.)**2 + cos(pi / 4.)**2
  print*, hypot(3., 4.)
  print*, len("This sentence is forty-two characters long")
end program intrinsic_functions
