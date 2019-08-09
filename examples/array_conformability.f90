program array_conformability
  implicit none
  integer :: i
  integer, dimension(3) :: vector1 = [(i, i=1, 3)]
  integer, dimension(3, 3) :: matrix1 = reshape(&
       [(i, i=1, 9)], shape(matrix1))
  integer, dimension(4) :: vector2 = [(i, i=1, 4)]
  integer, dimension(3, 4) :: matrix2 = reshape(&
       [(i, i=1, 12)], shape(matrix2))

  print*, "shape(vector1):", shape(vector1)
  print*, "shape(matrix1):", shape(matrix1)
  print*, "shape(matrix1(:, 1)):", shape(matrix1(:, 1))
  print*, "shape(matrix1(1, :)):", shape(matrix1(1, :))
  print*, "shape(matrix2):", shape(matrix2)
  print*, "shape(matrix2(1, :)):", shape(matrix2(1, :))
  print*, "shape(matrix2(:, 1)):", shape(matrix2(:, 1))

  ! Won't work, different sizes
  ! print*, vector1 + vector2

  ! Ok, can use a slice of vector2
  print*, vector1 + vector2(:3)

  ! Won't work because the ranks don't match
  ! print*, vector1 + matrix1

  ! Ok, shape(matrix1(:, 1)) == shape(vector1)
  print*, vector1 + matrix1(:, 1)

  ! Ok, shape(matrix1(1, :)) == shape(vector1)
  print*, vector1 + matrix1(1, :)

  ! Ok, can use slices on both operands
  print*, vector2(:2) + matrix1(:2, 1)

  ! Ok, scalars conform to any shape
  print*, vector1(1) + matrix1

  ! Won't work, shapes don't match
  ! print*, matrix1 + matrix2

  ! Ok, can use a slice
  print*, matrix1 + matrix2(:, :3)

  ! Won't work, shapes don't match
  ! print*, vector2 + matrix2(:, 1)

  ! Ok, shape(matrix2(1, :)) == shape(vector2)
  print*, vector2 + matrix2(1, :)

end program array_conformability
