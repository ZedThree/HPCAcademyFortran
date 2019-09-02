module particle_mod
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none
  type :: particle_type
    real(real64) :: position = 0._real64
    real(real64) :: velocity = 1._real64
  contains
    procedure :: update_position
  end type particle_type
contains
  elemental subroutine update_position(particle, timestep)
    class(particle_type), intent(inout) :: particle
    real(real64), intent(in) :: timestep
    particle%position = particle%position &
         + (timestep * particle%velocity)
  end subroutine update_position
end module particle_mod


program type_bound_procedure
  use, intrinsic :: iso_fortran_env, only : real64
  use particle_mod
  implicit none

  real(real64), parameter :: timestep = 1._real64

  type(particle_type), dimension(3) :: particles

  call random_number(particles%position)
  call random_number(particles%velocity)

  print*, particles%position

  call particles%update_position(timestep)
  ! Or:
  call update_position(particles, timestep)

  print*, particles%position
end program type_bound_procedure
