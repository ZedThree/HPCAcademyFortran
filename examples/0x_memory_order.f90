program memory_order
  use, intrinsic :: iso_fortran_env, only : real64
  implicit none

  integer, parameter :: nx = 128, ny = 128, nz = 128
  integer, parameter :: max_iteration = 1000
  integer :: iteration
  integer :: i, j, k
  real(real64), dimension(:, :, :), allocatable :: matrix1, matrix2
  real(real64) :: start_time, end_time

  allocate(matrix1(nx, ny, nz), matrix2(nx, ny, nz))
  matrix1 = 4.

  call cpu_time(start_time)

  do iteration = 1, max_iteration
    do k = 1, nz
      do j = 1, ny
        do i = 1, nx
          matrix1(i, j, k) = i + j + k
        end do
      end do
    end do
  end do

  call cpu_time(end_time)

  print*, "Correct order took ", end_time - start_time, " seconds"

  matrix2 = 4.

  call cpu_time(start_time)

  do iteration = 1, max_iteration
    do i = 1, nx
      do j = 1, ny
        do k = 1, nz
          matrix2(i, j, k) = i + j + k
        end do
      end do
    end do
  end do

  call cpu_time(end_time)

  print*, "Wrong order took ", end_time - start_time, " seconds"

  if (sqrt(sum((matrix2 - matrix1)**2)/(nx*ny*nz)) > 1.e-12) then
    error stop "Different answers"
  end if
  
end program memory_order
