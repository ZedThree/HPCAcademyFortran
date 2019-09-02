program format_more_records
  implicit none
  integer :: i, array_size
  integer, dimension(:), allocatable :: array

  print*, "Pick an array size:"
  read*, array_size

  array = [(i, i=1, array_size)]
  write(*, '("|", i2.1, " ", i2.1, "|")') array
end program format_more_records
