program open_and_read_file
  use, intrinsic :: iso_fortran_env, only : output_unit
  implicit none
  integer :: file_unit
  real :: height, width
  character(len=*), parameter :: output_format = '("Height: ", f5.3, ", width: ", f5.3, ", area: ", f6.3)'
  integer :: iostat
  character(len=200) :: error_message

  open(newunit=file_unit, file="rectangle.shape", status="old", &
       action="read", iostat=iostat, iomsg=error_message)

  if (iostat /= 0) then
    print*, "Something went wrong opening the file!"
    print*, error_message
    error stop
  end if
  
  read(unit=file_unit, fmt='(f5.3, f5.3)') height, width
  
  close(unit=file_unit)

  write(output_unit, output_format) height, width, height * width

end program open_and_read_file
