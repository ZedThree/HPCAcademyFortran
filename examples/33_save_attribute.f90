program save_attribute
  implicit none

  call count_to_10_wrong()
  call count_to_10_wrong()
  call count_to_10_wrong()

  call count_to_10_right()
  call count_to_10_right()
  call count_to_10_right()

  call count_to_10_cache()
  call count_to_10_cache()
  call count_to_10_cache()

contains
  subroutine count_to_10_wrong()
    integer :: count = 0
    integer :: i
    do i = 1, 10
      count = count + 1
    end do
    print*, "Initialisation in declaration =", count
  end subroutine count_to_10_wrong

  subroutine count_to_10_right()
    integer :: count
    integer :: i
    count = 0
    do i = 1, 10
      count = count + 1
    end do
    print*, "Initialisation not in declaration =", count
  end subroutine count_to_10_right

  subroutine count_to_10_cache()
    logical, save :: first_call = .true.
    integer, save :: count = 0
    integer :: i
    if (first_call) then
      do i = 1, 10
        count = count + 1
      end do
      first_call = .false.
    end if
    print*, "Explicit 'save' and cached flag =", count
  end subroutine count_to_10_cache

end program save_attribute
