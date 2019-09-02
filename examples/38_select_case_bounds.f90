program select_case_bounds
  implicit none
  integer :: number

  print*, "Pick a number:"
  read*, number

  select case(number)
  case (42)
    print*, "You picked exactly forty-two"
  case (:10)
    print*, "You picked a number less than or equal to ten"
  case (50:)
    print*, "You picked a number more than or equal to fifty"
  case (11:20)
    print*, "You picked a number between eleven and twenty"
  case default
    print*, "You picked a number between twenty and fifty,&
            & excluding forty-two"
  end select
end program select_case_bounds
