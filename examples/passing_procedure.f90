program passing_procedure
  implicit none

  abstract interface
    integer function univariate(x)
      integer, intent(in) :: x
    end function univariate
  end interface
  
  print*, apply(double, 42)
  print*, apply(add_two, 6)

  print*, apply2(double, 36)
  print*, apply2(add_two, 7)

contains

  integer function double(x)
    integer, intent(in) :: x
    double = 2 * x
  end function double

  integer function add_two(x)
    integer, intent(in) :: x
    add_two = x + 2
  end function add_two

  integer function apply(f, x)
    interface
      integer function f(y)
        integer, intent(in) :: y
      end function f
    end interface
    integer, intent(in) :: x

    apply = f(x)
  end function apply
  
  integer function apply2(f, x)
    integer, intent(in) :: x
    procedure(univariate) :: f

    apply2 = f(x)
  end function apply2

end program passing_procedure
