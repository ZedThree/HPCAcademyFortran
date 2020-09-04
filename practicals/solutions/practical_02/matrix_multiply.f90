program matrix_multiply
  implicit none

  integer, dimension(2, 3) :: array1 &
       = reshape([1, 2, 3, 4, 5, 6], shape(array1))
  integer, dimension(3, 2) :: array2 &
       = reshape([6, 5, 4, 3, 2, 1], shape(array2))

  print*, all(matmul(array1, array2) == matrix_matrix(array1, array2))

contains
  function matrix_matrix(matrix_a, matrix_b) result(answer)
    integer, dimension(:, :), intent(in) :: matrix_a
    integer, dimension(:, :), intent(in) :: matrix_b
    integer, dimension(size(matrix_a, 1), size(matrix_b, 2)) :: answer

    integer :: i, j

    if (size(matrix_a, 2) /= size(matrix_b, 1)) error stop "Bad array sizes"

    do i = 1, size(matrix_a, 1)
      do j = 1, size(matrix_b, 2)
        answer(i, j) = sum(matrix_a(i, :) * matrix_b(:, j))
      end do
    end do
  end function matrix_matrix
end program matrix_multiply

    
