program array_dummy_arguments
  implicit none

  integer, dimension(2, 2, 2) :: array
  integer, dimension(:, :, :), allocatable :: heap_array

  call fill_array(array)

  print*, "----------------"
  print*, "Fixed size array"
  call print_array_explicit(array)
  call print_array_explicit_passed_sizes(array, 2, 2, 2)
  call print_array_assumed_size(array, 2, 2)
  call print_array_assumed_shape(array)
  call print_array_assumed_shape_lowerbound(array)

  allocate(heap_array(-1:-1, 2:2, 3:3))
  call fill_array(heap_array)

  print*, "------------------"
  print*, "Dynamic size array"
  call print_array_explicit(heap_array)
  call print_array_explicit_passed_sizes(heap_array, 2, 2, 2)
  call print_array_assumed_size(heap_array, 2, 2)
  call print_array_assumed_shape(heap_array)
  call print_array_assumed_shape_lowerbound(heap_array)

contains
  subroutine print_array_explicit(array)
    integer, dimension(2, 2, 2), intent(in) :: array
    print*, "Explicit size array"
    print*, "shape of array: ", shape(array)
    print*, "value of array(2, 2, 2):", array(2, 2, 2)
    print*, ""
  end subroutine print_array_explicit

  subroutine print_array_explicit_passed_sizes(array, n, m, p)
    integer, intent(in) :: n, m, p
    integer, dimension(n, m, p), intent(in) :: array
    print*, "Separate size arguments"
    print*, "shape of array: ", shape(array)
    print*, "value of array(2, 2, 2):", array(2, 2, 2)
    print*, ""
  end subroutine print_array_explicit_passed_sizes

  subroutine print_array_assumed_size(array, n, m)
    integer, intent(in) :: n, m
    integer, dimension(n, m, *), intent(in) :: array
    print*, "Assumed size array"
    print*, "shape of array: ", size(array, dim=1), size(array, dim=2), "???"
    print*, "value of array(2, 2, 2):", array(2, 2, 2)
    print*, ""
  end subroutine print_array_assumed_size

  subroutine print_array_assumed_shape(array)
    integer, dimension(:, :, :), intent(in) :: array
    print*, "Assumed shape array"
    print*, "shape of array: ", shape(array)
    print*, "value of array(2, 2, 2):", array(2, 2, 2)
    print*, ""
  end subroutine print_array_assumed_shape

  subroutine print_array_assumed_shape_lowerbound(array)
    integer, dimension(1:, 2:, 3:), intent(in) :: array
    print*, "Assumed shape with explicit lower bounds"
    print*, "shape of array: ", shape(array)
    print*, "value of array(2, 3, 4):", array(2, 3, 4)
    print*, ""
  end subroutine print_array_assumed_shape_lowerbound

  subroutine fill_array(array)
    integer, dimension(:, :, :), intent(out) :: array
    integer:: i, j, k, index

    index = 0
    do k = 1, ubound(array, 1)
      do j = 1, ubound(array, 2)
        do i = 1, ubound(array, 3)
          index = index + 1
          array(i, j, k) = index
        end do
      end do
    end do
  end subroutine fill_array
  
end program array_dummy_arguments
