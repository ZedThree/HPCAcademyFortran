program do_while_none
  implicit none
  integer :: x = 10
  do while(x < 10)
    print*, x
    x = x + 1
  end do
end program do_while_none
