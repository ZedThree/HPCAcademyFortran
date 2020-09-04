program allocatable_function
  implicit none
  real, dimension(:), allocatable :: grid
  integer :: grid_size

  print*, "Enter size of grid:"
  read*, grid_size

  grid = make_grid(grid_size)

  print*, "Your grid is:"
  print*, grid

contains
  function make_grid(grid_size)
    integer, intent(in) :: grid_size
    real, dimension(:), allocatable :: make_grid
    integer :: i
    allocate(make_grid(grid_size))
    do i = 1, grid_size
      make_grid = real(i) / grid_size
    end do
  end function make_grid
end program allocatable_function
