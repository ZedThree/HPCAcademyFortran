program quadratics
  implicit none
  real :: a, b, c
  real :: discriminant

  print*, "Enter a, b, c separated by spaces:"
  read*, a, b, c

  discriminant = (b**2) - (4 * a * c)

  if (discriminant < 0) then
    print*, "There are no real solutions"
  else
    print*, "Solutions are:"
    print*, "  x =", (-b - sqrt(discriminant)) / (2 * a)
    print*, "  x =", (-b + sqrt(discriminant)) / (2 * a)
  end if
end program quadratics
