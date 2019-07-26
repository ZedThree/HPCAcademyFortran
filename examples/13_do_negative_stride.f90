program do_negative_stride
  implicit none
  integer :: i
  do i = 9, 0, -2
    print*, i
  end do
end program do_negative_stride
