program basic_subroutine
  implicit none
  integer :: a = 2

  print*, a
  call add_x_to_y(3, a)
  print*, a

contains
  subroutine add_x_to_y(x, y)
    integer :: x, y
    y = x + y
  end subroutine add_x_to_y
end program basic_subroutine
