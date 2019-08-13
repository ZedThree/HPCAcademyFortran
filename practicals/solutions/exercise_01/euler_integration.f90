program euler_integration
  use, intrinsic :: iso_fortran_env, only : real32, real64
  implicit none

  integer, parameter :: wp = real64

  integer :: total_timesteps
  real(kind=wp), parameter :: pi = 4.*atan(1.)
  real(kind=wp), parameter :: end = pi / 2.
  real(kind=wp) :: timestep
  integer :: i
  real(kind=wp) :: y

  do i = 1, 7
    total_timesteps = 10 ** i
    timestep = end / total_timesteps
    y = euler_integral(timestep, total_timesteps)
    print*, total_timesteps, y, pi / 4., y - (pi / 4.)
  end do

contains

  real(kind=wp) function euler_integral(timestep, N)
    real(kind=wp), intent(in) :: timestep
    integer, intent(in) :: N
    integer :: i
    real(kind=wp) :: y, current_time

    y = 0.
    current_time = 0.

    do i = 1, N
      y = euler_update(y, timestep, current_time)
      current_time = current_time + timestep
    end do

    euler_integral = y

  end function euler_integral

  real(kind=wp) function f(time)
    real(kind=wp), intent(in) :: time
    f = sin(time) ** 2
  end function f

  real(kind=wp) function euler_update(y_previous, timestep, time)
    real(kind=wp), intent(in) :: y_previous, timestep, time

    euler_update = y_previous + timestep * f(time)
  end function euler_update

end program euler_integration
