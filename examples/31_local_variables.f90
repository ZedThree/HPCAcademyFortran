program local_variables
  implicit none
  integer :: x = 4
  print*, add_square(x), x
contains
  integer function add_square(number)
    integer, intent(in) :: number
    integer :: x
    x = number * number
    add_square = number + x
  end function add_square
end program local_variables
