program loop_labels
  implicit none
  integer :: i, j
  outer: do i = 1, 3
    inner: do j = 1, 3
      if ((i + j) == 6) exit outer
      print*, i, j
    end do inner
  end do outer
end program loop_labels
