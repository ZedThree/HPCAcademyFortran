program cycle_with_label
  implicit none
  integer :: i, j

  outer: do i = 1, 5
    inner: do j = 1, 5
      if ((i + j) == 7) cycle outer
      print*, i, "+", j, "=", i + j
    end do inner
  end do outer

end program cycle_with_label
