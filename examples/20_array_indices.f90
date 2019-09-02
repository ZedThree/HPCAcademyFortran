program array_indices
  implicit none
  integer, dimension(-1:1) :: array
  integer :: i

  array(-1) = 12
  array(0) = 42
  array(1) = -18

  do i = -1, 1
    print*, array(i)
  end do
end program array_indices
