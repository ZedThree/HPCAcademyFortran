integer function idouble(x)
  integer, intent(in) :: x
  idouble = 2 * x
end function idouble

integer function iadd(a, b, c)
  integer, intent(in) :: a, b, c
  iadd = a + b + c
end function iadd
