program save_attribute
  implicit none

  call count_to_10_wrong()
  call count_to_10_wrong()
  call count_to_10_wrong()
  
  call count_to_10_right()
  call count_to_10_right()
  call count_to_10_right()

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
end program save_attribute
