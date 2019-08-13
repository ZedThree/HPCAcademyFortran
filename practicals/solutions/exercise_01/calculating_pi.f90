program calculating_pi
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none

  integer, parameter :: wp = real64

  integer, parameter :: N_max = 10**4, N_step = 100
  integer :: N
  real(kind=wp), dimension(:), allocatable :: points
  real(kind=wp) :: number_within_circle

  do N = N_step, N_max, N_step
    call random_seed()
    points = get_distances(N)
    number_within_circle = count(points < 1._wp)
    print*, N, 4._wp * (number_within_circle / N)
  end do
  
contains
  function get_distances(N) result(distances)
    integer, intent(in) :: N
    real(kind=wp), dimension(:), allocatable :: distances
    real(kind=wp), dimension(N) :: x, y

    call random_number(x)
    call random_number(y)

    x = (2._wp * x) - 1._wp
    y = (2._wp * y) - 1._wp

    distances = hypot(x, y)
  end function get_distances
end program calculating_pi
