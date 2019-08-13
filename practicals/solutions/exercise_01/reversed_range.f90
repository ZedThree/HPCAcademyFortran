program reversed_range
  implicit none
  integer :: lower, upper, temp
  integer :: i
  integer, dimension(100) :: array = [(i, i=1, 100)]

  print*, array

  do
    print*, "Enter lower and upper bounds"
    read*, lower, upper

    if (lower > upper) then
      temp = lower
      lower = upper
      upper = temp
    end if

    if ((lower > 1) .and. (upper < 100)) exit
  end do

  array(lower:upper) = array(upper:lower:-1)

  print*, array
end program reversed_range
