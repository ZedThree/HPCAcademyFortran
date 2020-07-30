program recursive
  implicit none
  integer :: i

  do i = 1, 10
    print*, i, fibonacci(i)
  end do
  
contains
  recursive function fibonacci(n) result(res)
    integer, intent(in) :: n
    integer :: res
    if ((n == 1) .or. (n == 2)) then
      res = 1
      return
    end if
    res = fibonacci(n - 1) + fibonacci(n - 2)
  end function fibonacci
end program recursive
