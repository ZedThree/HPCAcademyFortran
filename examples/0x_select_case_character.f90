program select_case_character
  implicit none
  character(len=20) :: animal

  print*, "Choose an animal: cat, dog, or pig"
  read*, animal

  select case (animal)
  case ("cat")
    print*, "meow!"
  case ("dog")
    print*, "woof!"
  case ("pig")
    print*, "oink!"
  case default
    print*, "<generic animal noise>"
  end select
end program select_case_character
