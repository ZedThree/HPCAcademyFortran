program do_exit
  implicit none
  integer :: x = 0
  do
    print*, x
    x = x + 1
    if (x >= 10) exit
  end do
end program do_exit
