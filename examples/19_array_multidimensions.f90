program array_multidimensions
  implicit none
  integer, dimension(3, 3) :: matrix1
  ! Or equivalently:
  integer :: matrix2(3, 3)
  integer, dimension (3, 3) :: matrix3, matrix4

  integer :: i, j

  do j = 1, 3
    do i = 1, 3
      matrix1(i, j) = i + (j * 3)
    end do
  end do

  ! All of first row:
  print*, "matrix1(1, :):", matrix1(1, :)
  ! First two rows, last two columns:
  print*, "matrix1(:2, 2:):", matrix1(:2, 2:)
  
  matrix2 = reshape([ &
       9, 8, 7, &
       6, 5, 4, &
       3, 2, 1], shape(matrix2))

  print*, "matrix1 - matrix2:"

  matrix3 = matrix1 - matrix2
  do i = 1, 3
    print*, matrix3(i, :)
  end do

  print*, "matmul(matrix1, matrix2):"

  matrix4 = matmul(matrix1, matrix2)
  do i = 1, 3
    print*, matrix4(i, :)
  end do
end program array_multidimensions
