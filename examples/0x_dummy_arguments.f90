program dummy_arguments
  implicit none

  integer :: x = 1, y = 2
  real :: z = 3.0

  call print_three_variables(x, y, z)

contains

  subroutine print_three_variables(a, b, c)
    integer, intent(in) :: a, b
    real, intent(in) :: c
    print*, "a is ", a
    print*, "b is ", b
    print*, "c is ", c
  end subroutine print_three_variables
end program dummy_arguments
