program elemental_functions
  implicit none

  integer, dimension(3) :: x = [1, 2, 3]
  print*, double(x)

contains
  elemental integer function double(x)
    integer, intent(in) :: x
    double = 2 * x
  end function double
end program elemental_functions
