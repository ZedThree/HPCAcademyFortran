program sum_100
  implicit none
  integer :: i
  integer :: sum_so_far = 0

  do i = 1, 100
    sum_so_far = sum_so_far + i
  end do

  print*, sum_so_far
end program sum_100
