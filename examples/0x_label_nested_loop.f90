program label_nested_loop
  implicit none

  integer :: i, j
  character(len=*), parameter :: row_format = '(" | ",I1, " | ", I1, " |   ", I1, "   |")'

  print('(A)'), "Without labels:"
  print('(A)'), " +---+---+-------+"
  print('(A)'), " | i | j | i + j |"
  print('(A)'), " +---+---+-------+"

  do i = 1, 4
   do j = 1, 4
      if ((i + j) == 6) exit
      print row_format, i, j, i + j
    end do
  end do

  print('(A)'), " +---+---+-------+"

  print('(A)'), "With labels:"
  print('(A)'), " +---+---+-------+"
  print('(A)'), " | i | j | i + j |"
  print('(A)'), " +---+---+-------+"

  outer: do i = 1, 4
    inner: do j = 1, 4
      if ((i + j) == 6) exit outer
      print row_format, i, j, i + j
    end do inner
  end do outer

  print('(A)'), " +---+---+-------+"
end program label_nested_loop
