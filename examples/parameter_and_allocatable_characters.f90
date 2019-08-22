program parameter_and_allocatable_characters
  implicit none
  character(len=*), parameter :: fixed_string = "output.log"
  character(len=:), allocatable :: flexible_string

  print*, len(fixed_string), fixed_string

  flexible_string = "first time"
  print*, len(flexible_string), flexible_string

  flexible_string = "second time"
  print*, len(flexible_string), flexible_string

end program parameter_and_allocatable_characters
