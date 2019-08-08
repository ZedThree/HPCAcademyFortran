program parameter_and_allocatable_characters
  implicit none
  character(len=*), parameter :: fixed_character = "output.log"
  character(len=:), allocatable :: flexible_character

  print*, len(fixed_character), fixed_character

  flexible_character = "first time"
  print*, len(flexible_character), flexible_character

  flexible_character = "second time"
  print*, len(flexible_character), flexible_character
end program parameter_and_allocatable_characters
