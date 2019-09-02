program save_attribute
  implicit none

  call increment_count_implicit()
  call increment_count_implicit()
  call increment_count_implicit()
  
  call increment_count_explicit()
  call increment_count_explicit()
  call increment_count_explicit()

contains
  subroutine increment_count_implicit()
    integer :: count = 0
    count = count + 1
    print*, "Called implicit version", count, "times"
  end subroutine increment_count_implicit

  subroutine increment_count_explicit()
    integer, save :: count = 0
    count = count + 1
    print*, "Called explicit version", count, "times"
  end subroutine increment_count_explicit
end program save_attribute
