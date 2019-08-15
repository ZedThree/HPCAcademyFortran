program write_to_character
  implicit none

  character(len=7) :: run_name
  integer :: run_number

  run_number = 456
  write(run_name, '(A, I4.4)') "run", run_number
  print*, run_name

  ! Too long for the character!
  run_number = 89988
  write(run_name, '(A, I4.4)') "run", run_number
  print*, run_name
end program write_to_character
