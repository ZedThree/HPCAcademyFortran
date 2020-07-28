program loss_of_precision
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none
  real, parameter :: pi = 3.141592653589793238462643383
  real(real64),parameter::pi_wrong = 3.141592653589793238462643383
  real(real64),parameter::pi_right = 3.141592653589793238462643383_real64
  print*, "real variable, real literal     :", pi
  print*, "real64 variable, real literal   :", pi_wrong
  print*, "real64 variable, real64 literal :", pi_right
  print*, "plain literal                   :", 3.141592653589793238462643383
  print*, "real64 literal                  :", 3.141592653589793238462643383_real64
  print*, "actual value                    :   3.141592653589793238462643383279502884197169399375"
end program loss_of_precision
