module generic_interfaces
  implicit none

  interface double
    module procedure idouble
    module procedure rdouble
  end interface double

contains
  function idouble(x)
    integer, intent(in) :: x
    integer :: idouble
    print*, "integer version"
    idouble = 2 * x
  end function idouble

  function rdouble(x)
    real, intent(in) :: x
    real :: rdouble
    print*, "real version"
    rdouble = 2 * x
  end function rdouble
end module generic_interfaces

program generic_interfaces_prog
  use generic_interfaces, only : double
  implicit none
  print*, double(2)
  print*, double(2.0)
end program generic_interfaces_prog
