program basic_namelist
  use, intrinsic :: iso_fortran_env, only : output_unit
  implicit none
  character(len=*), parameter :: output_format = '("Height: ", f5.3, ", width: ", f5.3, ", area: ", f6.3)'
  integer :: file_unit
  real :: height = 2.0, width = 3.0

  namelist /rectangle/ height, width

  open(newunit=file_unit, file="rectangle.nml")
  read(unit=file_unit, nml=rectangle)
  close(file_unit)
  
  write(output_unit, output_format) height, width, height * width
  print*, ""

  write(output_unit, nml=rectangle)
end program basic_namelist
