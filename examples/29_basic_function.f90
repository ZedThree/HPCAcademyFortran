program basic_function
  implicit none

  print*, kronecker_delta(1, 2)
  print*, kronecker_delta(2, 2)

contains
  function kronecker_delta(i, j) result(delta)
    integer, intent(in) :: i, j
    integer :: delta
    if (i == j) then
      delta = 1
    else
      delta = 0
    end if
  end function kronecker_delta
end program basic_function
