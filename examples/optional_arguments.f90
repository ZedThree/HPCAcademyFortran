program optional_arguments
  implicit none

  call greet("Peter")
  call greet("Peter", politely=.true.)

contains
  subroutine greet(name, politely)
    character(len=*), intent(in) :: name
    logical, intent(in), optional :: politely

    character(len=:), allocatable :: greeting

    greeting = "Hey, "

    if (present(politely)) then
      if (politely) then
        greeting = "Good morning, "
      end if
    end if

    print*, greeting, name
  end subroutine greet
end program optional_arguments
