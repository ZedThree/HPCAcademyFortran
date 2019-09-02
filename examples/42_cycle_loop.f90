program cycle_loop
  implicit none
  integer :: i

  do i = 1, 5
    if (i == 3) cycle
    print*, i
  end do
end program cycle_loop
