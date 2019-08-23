module animals
  implicit none

  type :: animal
  contains
    procedure, nopass :: make_noise
  end type animal

  type, extends(animal) :: cat
  contains
    procedure, nopass :: make_noise => meow
  end type cat

  type, extends(animal) :: dog
  contains
    procedure, nopass :: make_noise => bark
  end type dog

contains
  subroutine make_noise
    print*, "<generic animal noise>"
  end subroutine make_noise

  subroutine meow
    print*, "Meow!"
  end subroutine meow

  subroutine bark
    print*, "Woof!"
  end subroutine bark
end module animals

program type_override
  use animals, only : animal, cat, dog
  implicit none

  type(animal) :: unknown_animal
  type(cat) :: Lana
  type(dog) :: Spot

  call speak(unknown_animal)
  call speak(Lana)
  call speak(Spot)

contains
  subroutine speak(creature)
    class(animal), intent(in) :: creature
    call creature%make_noise
  end subroutine speak
end program type_override
