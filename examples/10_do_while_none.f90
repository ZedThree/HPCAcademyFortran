program do_while_none
  implicit none
  integer :: x = 5
  do while(x < 5)
    print*, x
    x = x + 1
  end do
end program do_while_none
