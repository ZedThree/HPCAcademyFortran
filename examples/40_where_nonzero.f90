program where_nonzero
  implicit none
  integer :: i
  real, dimension(6) :: pressure = [3., 5., 0.3, 6., -1.e-34, 2.]
  real, dimension(6) :: log_pressure

  where (pressure > 0)
    log_pressure = log(pressure)
  elsewhere
    log_pressure = -1.e20
  end where

  print*, log_pressure

  do i = 1, 6
    if (pressure(i) > 0) then
      log_pressure(i) = log(pressure(i))
    else
      log_pressure(i) = -1.e20
    end if
  end do

end program where_nonzero
