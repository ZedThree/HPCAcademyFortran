program repeating_format_string
  implicit none
  integer :: i
  integer, dimension(3, 3), parameter :: array = &
       reshape([(i, i=1, 9)], shape=shape(array))

  print*, array
  write(*, '(3("[", 3(i0, ", "), "], "))') array
end program repeating_format_string
