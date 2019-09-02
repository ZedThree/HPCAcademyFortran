module particle_properties
  use, intrinsic :: iso_fortran_env, only : real64
  use physical_constants, only : proton_mass, speed_of_light
  implicit none
  private ! Marks all entities as private by default
  ! Public attribute on a variable
  real(real64), parameter, public :: deuterium_mass = 1.99955249 * proton_mass
  ! Separate attribute for procedure
  public :: kinetic_energy
  ! Separate attribute for entity used from another module
  public :: proton_mass
contains
  function kinetic_energy(mass, velocity)
    use, intrinsic :: iso_fortran_env, only : real64
    real(real64), intent(in) :: mass, velocity
    real(real64) :: kinetic_energy

    if (is_relativistic(velocity)) then
      kinetic_energy = (lorentz_factor(velocity) - 1.) * mass * (speed_of_light**2)
    else
      kinetic_energy = 0.5 * mass * (velocity ** 2)
    end if
  end function kinetic_energy

  logical function is_relativistic(velocity)
    real(real64), intent(in) :: velocity
    is_relativistic = (velocity > 0.4 * speed_of_light)
  end function is_relativistic

  function lorentz_factor(velocity)
    real(real64), intent(in) :: velocity
    real(real64) :: lorentz_factor
    lorentz_factor = 1. / sqrt(1. - (velocity / speed_of_light)**2)
  end function lorentz_factor
end module particle_properties
