program global_variables
  implicit none
  integer :: x = 4
  print*, x
  print*, add_square(x)
  print*, x
contains
  integer function add_square(number)
    integer, intent(in) :: number
    x = number * number
    add_square = number + x
  end function add_square
end program global_variables
