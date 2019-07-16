program hello_input
  implicit none
  character(len=20) :: name
  integer :: number
  print*, "What is your name?"
  read*, name
  print*, "What is your favourite integer?"
  read*, number
  print*, "Hello, ", name, &
       & ", your favourite number is ", number, "!"
end program hello_input
