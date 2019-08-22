program type_inheritance
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none

  type :: particle_type
    real(real64) :: mass
    real(real64), dimension(3) :: velocity
  end type particle_type

  type, extends(particle_type) :: charged_particle_type
    real(real64) :: charge
  end type charged_particle_type
  
  type(particle_type) :: neutron
  type(charged_particle_type) :: proton

  neutron%mass = 1._real64
  neutron%velocity = [real(real64):: 1, 2, 3]

  proton%mass = 1._real64
  proton%velocity = [real(real64):: 3, 2, 1]
  proton%charge = 1._real64

  print*, kinetic_energy(neutron)
  print*, kinetic_energy(proton)

contains

  function kinetic_energy(particle)
    class(particle_type), intent(in) :: particle
    real(real64) :: kinetic_energy

    kinetic_energy = 0.5 * particle%mass &
         * dot_product(particle%velocity, particle%velocity)
  end function kinetic_energy

end program type_inheritance
