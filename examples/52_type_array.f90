program type_array
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none

  real(real64), parameter :: timestep = 1._real64

  type :: particle_type
    real(real64) :: position = 0._real64
    real(real64) :: velocity = 1._real64
  end type particle_type

  type(particle_type), dimension(3) :: particles

  call random_number(particles%position)
  call random_number(particles%velocity)

  print*, particles%position

  particles%position = particles%position &
       + (timestep * particles%velocity)

  print*, particles%position

end program type_array
