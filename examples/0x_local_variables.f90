program local_variables
  implicit none
  integer :: x = 4

  print*, add_square(x), x

contains

  function add_square(number) result(res)
    integer, intent(in) :: number
    integer :: res
    integer :: x
    x = number * number
    res = number + x
  end function add_square
end program local_variables
