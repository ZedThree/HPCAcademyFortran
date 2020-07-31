program block_demo
  implicit none
  integer :: y = 1
  print*, y

  block
    real :: x = 3.142
    print*, x
    y = x
  end block

  print*, y
end program block_demo
