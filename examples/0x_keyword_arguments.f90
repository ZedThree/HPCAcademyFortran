program keyword_arguments
  implicit none
  integer :: x = 1, y = 2
  real :: z = 3.0

  call print_three_variables(b=y, c=z, a=x)
contains
  subroutine print_three_variables(a, b, c)
    integer, intent(in) :: a, b
    real, intent(in) :: c
    print*, "a is ", a, "; b is ", b, "; c is ", c
  end subroutine print_three_variables
end program keyword_arguments
