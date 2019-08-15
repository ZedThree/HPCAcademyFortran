program reshape_order
  implicit none
  integer :: i
  character(len=*), parameter :: format_string = &
       '(2(2((I0, ", ", I0), "' // new_line('a') // '"), "' // new_line('a') // '"))'
  integer, dimension(2, 2, 2) :: array = reshape([(i, i=1, 8)], shape(array))

  write(*, format_string) array
  write(*, format_string) reshape(array, shape(array), order=[1, 3, 2])
  write(*, format_string) reshape(array, shape(array), order=[2, 1, 3])
  write(*, format_string) reshape(array, shape(array), order=[2, 3, 1])
  write(*, format_string) reshape(array, shape(array), order=[3, 1, 2])
  write(*, format_string) reshape(array, shape(array), order=[3, 2, 1])
end program reshape_order
