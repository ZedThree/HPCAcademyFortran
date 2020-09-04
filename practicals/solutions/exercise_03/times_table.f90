program times_table
  implicit none

  integer :: i
  integer, parameter :: n = 10
  integer, dimension(n) :: numbers

  do i = 1, n
    numbers(i) = i
  end do

  write(*, '("   |", 10(i4.1))') numbers
  write(*, '("----", 10("----"))')

  do i = 1, n
    write(*, '(i3.1, "|", 10(i4.1))') i, i * numbers
  end do
  
end program times_table
