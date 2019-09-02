program block_demo
  implicit none
  integer :: x = 1
  print*, x

  block
    real :: x = 3.142
    print*, x
  end block

  print*, x
end program block_demo
