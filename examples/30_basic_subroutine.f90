program basic_subroutine
  implicit none
  integer :: x = 2

  print*, x
  call increment_x_by_y(x, 3)
  print*, x

contains
  subroutine increment_x_by_y(x, y)
    integer, intent(inout) :: x
    integer, intent(in) :: y
    x = x + y
  end subroutine increment_x_by_y
end program basic_subroutine
