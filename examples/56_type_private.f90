module invariant_mod
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none

  ! Can only interact with particle_type through its methods
  private
  public :: particle_type

  type :: particle_type
    private
    real(real64) :: velocity = 0._real64
    real(real64) :: mass = 0._real64
    real(real64) :: kinetic_energy = 0._real64
  contains
    procedure, public :: set_velocity
    procedure, public :: set_mass
    procedure, public :: get_kinetic_energy
    procedure :: set_kinetic_energy
  end type particle_type

contains
  subroutine set_velocity(particle, velocity)
    class(particle_type), intent(inout) :: particle
    real(real64), intent(in) :: velocity

    particle%velocity = velocity

    call particle%set_kinetic_energy()
  end subroutine set_velocity

  subroutine set_mass(particle, mass)
    class(particle_type), intent(inout) :: particle
    real(real64), intent(in) :: mass

    particle%mass = mass

    call particle%set_kinetic_energy()
  end subroutine set_mass

  subroutine set_kinetic_energy(particle)
    class(particle_type), intent(inout) :: particle

    particle%kinetic_energy = 0.5 * particle%mass &
         * particle%velocity**2
  end subroutine set_kinetic_energy

  real(real64) function get_kinetic_energy(particle)
    class(particle_type), intent(in) :: particle
    get_kinetic_energy = particle%kinetic_energy
  end function get_kinetic_energy

end module invariant_mod


program type_private
  use, intrinsic :: iso_fortran_env, only : real64
  use invariant_mod
  implicit none

  type(particle_type) :: particle

  call particle%set_velocity(-3.0_real64)
  call particle%set_mass(2.0_real64)

  print*, particle%get_kinetic_energy()
end program type_private
