program convert
  implicit none

  print*, format_string(1234)
  print*, format_string(-56789)
  print*, number_to_string(1234)
  print*, number_to_string(-56789)

contains
  function length_of_number(number) result(digits)
    integer, intent(in) :: number
    integer :: digits
    digits = int(log10(real(abs(number)))) + 1
    if (number < 0) digits = digits + 1
  end function length_of_number
    
  function format_string(number)
    integer, intent(in) :: number
    character(len=5) :: format_string
    write(format_string, '(a, i2.2, a)') "(i", length_of_number(number), ")"
  end function format_string

  function number_to_string(number)
    integer, intent(in) :: number
    character(len=:), allocatable :: number_to_string
    allocate(character(len=length_of_number(number))::number_to_string)
    write(number_to_string, format_string(number)) number
  end function number_to_string
end program convert

