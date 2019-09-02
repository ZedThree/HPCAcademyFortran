program logical_boolean_operations
  implicit none
  integer :: x = 5
  if ((x >= 0) .and. (x < 10)) then
    print*, "x is between 0 and 10"
  else
    print*, "x not between 0 and 10"
  end if
end program logical_boolean_operations
