program do_while
  implicit none
  integer :: x = 0
  do while(x < 10)
    print*, x
    x = x + 1
  end do
end program do_while
