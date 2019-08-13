program factorials
  implicit none

  print*, factorial_do(4)
  print*, factorial_recursive(4)
  print*, factorial_elemental([1, 2, 3, 4])

contains

  integer function factorial_do(n)
    integer, intent(in) :: n
    integer :: i
    factorial_do = 1
    do i = 2, n
      factorial_do = factorial_do * i
    end do
  end function factorial_do

  recursive function factorial_recursive(n) result(fac)
    integer, intent(in) :: n
    integer :: fac

    if (n == 1) then
      fac = 1
      return
    end if
    
    fac = n * factorial_recursive(n - 1)
  end function factorial_recursive
  
  elemental integer function factorial_elemental(n)
    integer, intent(in) :: n
    integer :: i
    factorial_elemental = 1
    do i = 2, n
      factorial_elemental = factorial_elemental * i
    end do
  end function factorial_elemental

end program factorials
