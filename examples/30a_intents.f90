program intents
  implicit none
  integer :: a = 2

  print*, a
  call add_x_to_y(3, a)
  print*, a

contains
  subroutine add_x_to_y(x, y)
    integer, intent(in) :: x
    integer, intent(inout) :: y
    y = x + y
  end subroutine add_x_to_y
end program intents
