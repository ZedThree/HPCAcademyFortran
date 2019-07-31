program integer_division
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none
  integer :: x = 5

  print*, x / 2
  print*, x / real(2)
  print*, x / 2.
  print*, x / real(2, kind=real64)
end program integer_division
