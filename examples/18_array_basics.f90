program array_basics
  implicit none
  integer, dimension(3) :: vector1
  ! Or equivalently:
  integer :: vector2(3)

  integer :: i
  
  do i = 1, 3
    vector1(i) = i
  end do
  
  print*, "vector1(1):", vector1(1)
  print*, "vector1(2:3):", vector1(2:3)
  print*, "vector1(1:3:2):", vector1(1:3:2)
  print*, "vector1(3:1:-1):", vector1(3:1:-1)

  vector2 = [4, 5, 6]

  print*, "42 + vector1:", 42 + vector1
  print*, "2 * vector1:", 2 * vector1
  print*, "vector1 + vector2:", vector1 + vector2
  print*, "vector1 - vector2:", vector1 - vector2
  print*, "vector1 * vector2:", vector1 * vector2
  print*, "vector1 / vector2:", vector1 / vector2
  print*, "dot_product(vector1, vector2):", dot_product(vector1, vector2)
end program array_basics
