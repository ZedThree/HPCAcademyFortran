program array_bounds
  implicit none
  integer, dimension(-1:1) :: array

  call print_bounds(array)
contains
  subroutine print_bounds(array)
    integer, dimension(:), intent(in) :: array
    print*, lbound(array, 1), ubound(array, 1)
  end subroutine print_bounds
end program array_bounds
