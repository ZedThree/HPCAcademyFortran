program bigarray_prog
  use, intrinsic :: iso_fortran_env, only : real64, int64
  implicit none
  integer(int64), parameter :: bignumber = huge(1) * 2
  real(real64), dimension(:), allocatable ::bigarray
  integer :: status
  character(len=200) :: errmsg

  allocate(bigarray(bignumber), stat=status, errmsg=errmsg)

  if (status /= 0) then
    print*, trim(errmsg)
    print*, status
    error stop
    ! F2018:
    ! error stop status
  end if
  
end program bigarray_prog
