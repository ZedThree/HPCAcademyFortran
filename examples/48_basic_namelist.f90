program basic_namelist
  use, intrinsic :: iso_fortran_env, only : output_unit
  implicit none
  integer :: height = 2, width = 3
  integer :: file_unit

  namelist /rectangle/ height, width

  open(newunit=file_unit, file="rectangle.nml")
  read(file_unit, rectangle)
  close(file_unit)
  
  print*, "area = ", height * width
  print*, ""

  write(output_unit, nml=rectangle)
end program basic_namelist
