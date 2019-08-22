module physical_constants
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none
  real(real64), parameter :: speed_of_light = 299792458._real64      ! metres/second
  real(real64), parameter :: proton_mass = 1.6726219e-27_real64      ! kilograms
  real(real64), parameter :: electron_charge = 1.60217662e-19_real64 ! coulombs
end module physical_constants
