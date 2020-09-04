program reversed_range
  implicit none
  integer :: lower, upper, temp
  integer :: i
  integer, parameter :: array_size = 10
  integer, dimension(array_size) :: array

  do i = 1, array_size
    array(i) = i
  end do

  write(*,'(10i4)') array

  input_loop: do
    print*, "Enter lower and upper bounds"
    read*, lower, upper

    if (lower > upper) then
      temp = lower
      lower = upper
      upper = temp
    end if

    if ((lower > 1) .and. (upper < array_size)) exit input_loop
  end do input_loop

  array(lower:upper) = array(upper:lower:-1)

  write(*,'(10i4)') array
end program reversed_range
