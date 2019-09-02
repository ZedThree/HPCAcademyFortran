program basic_types
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none

  type :: velocity_type
    real(real64) :: x, y, z
  end type velocity_type

  type :: particle_type
    real(real64) :: mass
    type(velocity_type) :: velocity
  end type particle_type

  type(particle_type) :: proton

  proton%mass = 1._real64
  proton%velocity%x = 1._real64
  proton%velocity%y = 2._real64
  proton%velocity%z = 3._real64

  print*, kinetic_energy(proton)

contains

  function kinetic_energy(particle)
    type(particle_type), intent(in) :: particle
    real(real64) :: kinetic_energy

    kinetic_energy = 0.5 * particle%mass &
         * (particle%velocity%x**2 &
            + particle%velocity%y**2 &
            + particle%velocity%z**2)
  end function kinetic_energy

end program basic_types
