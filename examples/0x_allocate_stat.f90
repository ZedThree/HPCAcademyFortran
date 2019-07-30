program bigarray_prog
  use, intrinsic :: iso_fortran_env, only : real64, int64
  implicit none
  integer(int64), parameter :: bignumber = huge(1) * 2
  real(real64), dimension(:), allocatable ::bigarray
  integer :: stat
  character(len=200) :: errmsg

  allocate(bigarray(bignumber), stat=stat, errmsg=errmsg)

  if (stat /= 0) then
    print*, trim(errmsg)
    print*, stat
    error stop
    ! F2018:
    ! error stop stat
  end if
  
end program bigarray_prog
