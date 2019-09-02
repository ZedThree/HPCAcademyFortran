program positive_negative
  implicit none
  integer :: x
  print*, "Pick any number"
  read*, x
  if (x >= 0) then
    print*, "You picked a positive number"
  else if (x > 1) then
    print*, "This can never be reached!"
  else
    print*, "You picked a negative number"
  end if
end program positive_negative
