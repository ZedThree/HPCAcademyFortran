program using_modules
  use, intrinsic :: iso_fortran_env, only : real64
  ! Only get kinetic_energy, deuterium_mass and proton_mass
  use particle_properties
  ! Can see everything, but only get speed_of_light and rename it
  use physical_constants, only : c => speed_of_light
  implicit none

  print*, kinetic_energy(deuterium_mass, 10._real64)
  print*, kinetic_energy(deuterium_mass, 0.2*c)
  print*, kinetic_energy(deuterium_mass, 0.3999*c)
  print*, kinetic_energy(deuterium_mass, 0.4001*c)
  print*, kinetic_energy(deuterium_mass, 0.8*c)

end program using_modules
