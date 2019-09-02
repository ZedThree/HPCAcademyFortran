program external_function_with_interface
  implicit none
  interface
    integer function idouble(x)
      integer, intent(in) :: x
    end function idouble

    integer function iadd(a, b, c)
      integer, intent(in) :: a, b, c
    end function iadd
  end interface

  print*, idouble(2)
  print*, iadd(2, 3, 4)
end program external_function_with_interface
