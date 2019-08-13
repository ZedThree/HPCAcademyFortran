program mean_and_std
  implicit none

  real :: mean, std
  real, dimension(10000) :: x

  call random_number(x)
  call statistics(x, mean, std)
  print*, mean, std

contains

  subroutine statistics(x, mean, std)
    real, dimension(:), intent(in) :: x
    real, intent(out) :: mean
    real, intent(out) :: std

    mean = sum(x) / size(x)

    std = sqrt(sum((x - mean)**2) / size(x))

  end subroutine statistics
end program mean_and_std
